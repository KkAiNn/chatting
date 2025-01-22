/*
 * @Author: wurangkun
 * @Date: 2025-01-21 17:23:45
 * @LastEditTime: 2025-01-22 12:00:50
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\chat\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/im/conversation.dart';
import 'package:flutter_chat/utils/log_util.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_chat/base/view/common_view.dart';
import 'logic.dart';

class ChatPage extends BaseCommonView<ChatLogic> {
  ChatPage({super.key});
  final logic = Get.find<ChatLogic>();
  final conversation = Get.find<ConversationController>();

  @override
  String? get navTitle => conversation.currentConversation?.showName;

  @override
  Widget buildContent() {
    return creatCommonView(
      logic,
      (con) => Center(
        child: TextButton(
          onPressed: () {
            logic.sendMessage();
          },
          child: Text('发送'),
        ),
      ),
    );
  }
}
