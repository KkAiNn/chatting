/*
 * @Author: wurangkun
 * @Date: 2024-10-21 15:04:44
 * @LastEditTime: 2025-01-22 13:53:34
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\views\home\index.dart
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_chat/base/view/common_list.dart';
import 'package:flutter_chat/enum/im.dart';
import 'package:flutter_chat/pages/tabbar/views/home/logic.dart';
import 'package:flutter_chat/pages/tabbar/views/home/widget/conversation_item.dart';
import 'package:flutter_chat/providers/im/im.dart';
import 'package:flutter_chat/utils/log_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends BaseListView<HomeLogic> {
  HomePage({super.key});
  final logic = Get.find<HomeLogic>();

  @override
  bool? get isHiddenNav => false;

  @override
  String? get navTitle => 'home';

  GlobalKey repaintKey = GlobalKey();
  @override
  List<Widget>? get rightActionList => [
    IconButton(
      onPressed: () {
        Get.isDarkMode
            ? Get.changeThemeMode(ThemeMode.light)
            : Get.changeThemeMode(ThemeMode.dark);
      },
      icon:
          Get.isDarkMode
              ? const Icon(Icons.sunny)
              : const Icon(Icons.nightlight_round),
    ),
  ];

  @override
  Widget buildContent() {
    return GetBuilder<HomeLogic>(
      builder:
          (_) => SizedBox(
            height: 1.sh,
            child: Column(
              children: [
                // TextButton(
                //   onPressed: () {
                //     logic.conversation.toChatRoomV2();
                //   },
                //   child: Text('聊天'),
                // ),
                // TextButton(
                //   onPressed: () {
                //     logic.imController.onChangeConnectionStatus(
                //       ImConnectionStatus.V2TIM_CONN_STATUS_CONNECTED,
                //     );
                //     logic.refreshDataV2();
                //     ImMannger().getLoginStatusRes();
                //   },
                //   child: Text('刷新'),
                // ),
                Container(
                  width: 1.sw,
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(8.sp),
                  child:
                      logic.imController.connectionStatus ==
                              ImConnectionStatus.V2TIM_CONN_STATUS_CONNECTING
                          ? Text('连接中...')
                          : Text('连接成功'),
                ),
                Expanded(
                  child: creatRefresherListView(
                    logic,
                    (con) => ListView.builder(
                      itemBuilder:
                          (context, index) => ConversationItemSlidable(
                            index: index,
                            conversation:
                                logic.conversation.conversationList[index]!,
                            onTap: () {
                              logic.conversation.toChatRoom(
                                logic.conversation.conversationList[index]!,
                              );
                            },
                            onDelete: () {
                              logic.conversation.deleteConversation(
                                logic.conversation.conversationList[index]!,
                              );
                            },
                            onTop: () {
                              logic.pinConversation(
                                logic.conversation.conversationList[index]!,
                              );
                            },
                          ),
                      itemCount: logic.conversation.conversationList.length,
                    ),
                    enableLoadMoreVibrate: false,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
