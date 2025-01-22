/*
 * @Author: wurangkun
 * @Date: 2025-01-21 17:23:24
 * @LastEditTime: 2025-01-21 17:36:51
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\chat\logic.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/im/conversation.dart';
import 'package:flutter_chat/providers/im/sendMessage.dart';
import 'package:get/get.dart';
import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';

class ChatLogic extends BaseCommonController {
  ImConversation conversation = ImConversation();

  @override
  void onInit() {
    super.onInit();

    /// 初始化数据
    netState = NetState.dataSussessState;
  }

  @override
  void initData() {
    /// 页面请求初始化数据
    // netState = NetState.dataSussessState;
    // update();
  }
  @override
  void loadMore() {}
  @override
  void onHidden() {}
  @override
  void refreshData() {}

  sendMessage() {
    Sendmessage().createTextMessage();
  }
}
