/*
 * @Author: wurangkun
 * @Date: 2025-01-21 14:04:07
 * @LastEditTime: 2025-01-22 13:31:04
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\providers\im\im.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/enum/im.dart';
import 'package:flutter_chat/providers/im/conversation.dart';
import 'package:flutter_chat/utils/log_util.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSDKListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/log_level_enum.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_callback.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_status.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

import 'GenerateTestUserSig.dart';

class ImController extends GetxController {
  ImConnectionStatus connectionStatus =
      ImConnectionStatus.V2TIM_CONN_STATUS_CONNECTING;
  int unread = 0;
  onChangeConnectionStatus(ImConnectionStatus status) {
    Log.info(status.toString());
    connectionStatus = status;
    update();
  }
}

class ImMannger {
  int sdkAppID = 1400788779;
  String key =
      '1b49ad0478e4578418fe52a0fd7b34c15e13f0741e20076e77856361fb094b2d';
  String userID = "50a8564804094260b70d6696a1ca984c";

  /// 单位为秒
  int expire = 60 * 60 * 24 * 365;
  init() async {
    // ImController imController = Get.put(ImController());
    ImController imController = Get.find<ImController>();
    // 1. 从即时通信 IM 控制台获取应用 SDKAppID。
    // 2. 添加 V2TimSDKListener 的事件监听器，sdkListener 是 V2TimSDKListener 的实现类
    V2TimSDKListener sdkListener = V2TimSDKListener(
      onConnectFailed: (int code, String error) {
        // 连接失败的回调函数
        // code 错误码
        // error 错误信息
        imController.onChangeConnectionStatus(
          ImConnectionStatus.V2TIM_CONN_STATUS_DISCONNECTED,
        );
      },
      onConnectSuccess: () {
        // SDK 已经成功连接到腾讯云服务器
        imController.onChangeConnectionStatus(
          ImConnectionStatus.V2TIM_CONN_STATUS_CONNECTED,
        );
      },
      onConnecting: () {
        // SDK 正在连接到腾讯云服务器
        imController.onChangeConnectionStatus(
          ImConnectionStatus.V2TIM_CONN_STATUS_CONNECTING,
        );
      },
      onKickedOffline: () {
        // 当前用户被踢下线，此时可以 UI 提示用户，并再次调用 V2TIMManager 的 login() 函数重新登录。
        imController.onChangeConnectionStatus(
          ImConnectionStatus.V2TIM_CONN_STATUS_DISCONNECTED,
        );
        AlertDialog(
          content: Text(
            '当前用户被踢下线，此时可以 UI 提示用户，并再次调用 V2TIMManager 的 login() 函数重新登录。',
          ),
        );
      },
      onSelfInfoUpdated: (V2TimUserFullInfo info) {
        // 登录用户的资料发生了更新
        // info登录用户的资料
      },
      onUserSigExpired: () {
        // 在线时票据过期：此时您需要生成新的 userSig 并再次调用 V2TIMManager 的 login() 函数重新登录。
        login();
      },
      onUserStatusChanged: (List<V2TimUserStatus> userStatusList) {
        //用户状态变更通知
        //userStatusList 用户状态变化的用户列表
        //收到通知的情况：订阅过的用户发生了状态变更（包括在线状态和自定义状态），会触发该回调
        //在 IM 控制台打开了好友状态通知开关，即使未主动订阅，当好友状态发生变更时，也会触发该回调
        //同一个账号多设备登录，当其中一台设备修改了自定义状态，所有设备都会收到该回调
      },
    );
    // 3.初始化SDK
    V2TimValueCallback<bool> initSDKRes = await TencentImSDKPlugin.v2TIMManager
        .initSDK(
          sdkAppID: sdkAppID, // SDKAppID
          loglevel: LogLevelEnum.V2TIM_LOG_WARN, // 日志登记等级
          listener: sdkListener, // 事件监听器
        );
    if (initSDKRes.code == 0) {
      Log.info('initSDK success');

      //初始化成功
      await login();
    }
  }

  unInit() {
    // 反初始化 SDK
    TencentImSDKPlugin.v2TIMManager.unInitSDK();
  }

  login() async {
    GenerateTestUserSig gen = GenerateTestUserSig(sdkappid: sdkAppID, key: key);
    String userSig = gen.genSig(identifier: userID, expire: expire);
    V2TimCallback res = await TencentImSDKPlugin.v2TIMManager.login(
      userID: userID,
      userSig: userSig,
    );
    if (res.code == 0) {
      ImController imController = Get.find<ImController>();
      // 登录成功逻辑
      ImConversation().getTotalUnreadMessageCount();
      ImConversation().listenerConversationList(
        onTotalUnreadMessageCountChanged: (int totalUnreadCount) {
          // 未读消息数量变化
          imController.unread = totalUnreadCount;
        },
      );
    } else {
      // 登录失败逻辑
    }
  }

  /// 获取登录状态
  getLoginStatusRes() async {
    V2TimValueCallback<int> res =
        await TencentImSDKPlugin.v2TIMManager.getLoginStatus();
    // 登录状态
    if (res.code == 0) {
      int? status = res.data; // getLoginStatusRes.data为用户登录状态值
      if (status == 1) {
        // 已登录
        Log.info('已登录');
      } else if (status == 2) {
        // 登录中
        Log.info('登录中');
      } else if (status == 3) {
        // 未登录
        Log.info('未登录');
      }
    }
  }

  /// 登出
  logout() async {
    V2TimCallback logoutRes = await TencentImSDKPlugin.v2TIMManager.logout();
    if (logoutRes.code == 0) {}
  }
}
