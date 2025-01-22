/*
 * @Author: wurangkun
 * @Date: 2025-01-21 14:25:54
 * @LastEditTime: 2025-01-22 11:11:54
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\providers\im\conversation.dart
 * @Description: 
 */
import 'package:flutter_chat/providers/im/im.dart';
import 'package:flutter_chat/routes/index.dart';
import 'package:flutter_chat/utils/loading.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimConversationListener.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_conversation_manager.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

class ConversationController extends GetxController {
  V2TimConversation? currentConversation;

  onChangeConnectionStatus(V2TimConversation conversation) {
    currentConversation = conversation;
    update();
  }
}

class ImConversation {
  static V2TIMConversationManager conversationManager =
      TencentImSDKPlugin.v2TIMManager.getConversationManager();

  List<V2TimConversation?> conversationList = [];
  bool isFinished = false;
  String nextSeq = '0'; //分页拉取的游标

  //获取会话列表
  Future<V2TimConversationResult?> getConversationList() async {
    print('getConversationList ，$isFinished, $nextSeq');
    // if (isFinished == true) {
    //   return conversationList!;
    // }
    V2TimValueCallback<V2TimConversationResult> getConversationListRes =
        await conversationManager.getConversationList(
          count: 100, //分页拉取的个数，一次分页拉取不宜太多，会影响拉取的速度，建议每次拉取 100 个会话
          nextSeq: nextSeq, //分页拉取的游标，第一次默认取传 0，后续分页拉传上一次分页拉取成功回调里的 nextSeq
        );
    if (getConversationListRes.code == 0) {
      isFinished = getConversationListRes.data?.isFinished ?? false; //是否拉取完
      if (nextSeq == '0') {
        //拉取成功
        conversationList =
            getConversationListRes.data?.conversationList ?? []; //此次拉取到的消息列表
      } else {
        conversationList?.addAll(
          getConversationListRes.data?.conversationList ?? [],
        ); //此次拉取到的消息列表
      }
      nextSeq = getConversationListRes.data?.nextSeq ?? '0'; //后续分页拉取的游标
      // getConversationListRes.data?.conversationList?.forEach((element) {
      //   element
      //       ?.conversationID; //会话唯一 ID，如果是单聊，组成方式为 c2c_userID；如果是群聊，组成方式为 group_groupID。
      //   element?.draftText; //草稿信息
      //   element?.draftTimestamp; //草稿编辑时间，草稿设置的时候自动生成。
      //   element?.faceUrl; //会话展示头像，群聊头像：群头像；单聊头像：对方头像。
      //   element?.groupAtInfoList; //群会话 @ 信息列表，通常用于展示 “有人@我” 或 “@所有人” 这两种提醒状态。
      //   element?.groupID; //当前群聊 ID，如果会话类型为群聊，groupID 会存储当前群的群 ID，否则为 null。
      //   element?.groupType; //当前群聊类型，如果会话类型为群聊，groupType 为当前群类型，否则为 null。
      //   element?.isPinned; //会话是否置顶
      //   element?.lastMessage; //会话最后一条消息
      //   element?.orderkey; //会话排序字段
      //   element?.recvOpt; //消息接收选项
      //   element
      //       ?.showName; //会话展示名称，群聊会话名称优先级：群名称 > 群 ID；单聊会话名称优先级：对方好友备注 > 对方昵称 > 对方的 userID。
      //   element?.type; //会话类型，分为 C2C（单聊）和 Group（群聊）。
      //   element?.unreadCount; //会话未读消息数，直播群（AVChatRoom）不支持未读计数，默认为 0。
      //   element?.userID; //对方用户 ID，如果会话类型为单聊，userID 会存储对方的用户 ID，否则为 null。
      // });
    }
    return getConversationListRes.data;
  }

  Future<V2TimConversationResult?> refreshConversationList() async {
    nextSeq = '0';
    isFinished = false;
    return await getConversationList();
  }

  listenerConversationList({
    /// 有会话更新
    Function(List<V2TimConversation>)? onConversationChanged,

    /// 有会话新增
    void Function(List<V2TimConversation>)? onNewConversation,

    /// 会话未读总数变更通知
    Function(int)? onTotalUnreadMessageCountChanged,

    /// 同步服务器会话开始
    void Function()? onSyncServerStart,

    /// 同步服务器会话完成
    void Function()? onSyncServerFinish,

    /// 同步服务器会话失败
    void Function()? onSyncServerFailed,
  }) {
    conversationManager.addConversationListener(
      listener: V2TimConversationListener(
        /// 有会话更新
        onConversationChanged: (conversationList) {
          print('有会话更新');
          onConversationChanged?.call(conversationList);
        },

        /// 有会话新增
        onNewConversation: (conversationList) {
          print('有新消息');
          onNewConversation?.call(conversationList);
        },

        /// 会话未读总数变更通知
        onTotalUnreadMessageCountChanged: (count) {
          print(count);
          onTotalUnreadMessageCountChanged?.call(count);
        },

        /// 同步服务器会话开始
        onSyncServerStart: () {
          onSyncServerStart?.call();
        },

        /// 同步服务器会话完成
        onSyncServerFinish: () {
          onSyncServerFinish?.call();
        },

        /// 同步服务器会话失败
        onSyncServerFailed: () {
          onSyncServerFailed?.call();
        },
      ),
    );
  }

  removeListenerConversationList() {
    conversationManager.removeConversationListener();
  }

  getTotalUnreadMessageCount() async {
    ImController imController = Get.put(ImController());
    V2TimValueCallback<int> unread =
        await conversationManager.getTotalUnreadMessageCount();
    if (unread.code == 0) {
      imController.unread = unread.data ?? 0;
    }
  }

  toChatRoomV2() async {
    Get.toNamed(RouteName.Chat);
  }

  toChatRoom(V2TimConversation conversation) async {
    ConversationController conversationController = Get.put(
      ConversationController(),
    );
    V2TimValueCallback<V2TimConversation> res = await conversationManager
        .getConversation(conversationID: conversation.conversationID);
    if (res.code == 0) {
      conversationController.currentConversation = res.data;
      Get.toNamed(RouteName.Chat);
    } else {
      showError('获取会话失败');
    }
  }

  deleteConversation(V2TimConversation conversation) {
    conversationManager.deleteConversation(
      conversationID: conversation.conversationID,
    );
  }

  pinConversation(V2TimConversation conversation) {
    conversationManager.pinConversation(
      conversationID: conversation.conversationID,
      isPinned: conversation.isPinned!,
    );
  }
}
