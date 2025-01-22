/*
 * @Author: wurangkun
 * @Date: 2025-01-22 10:43:24
 * @LastEditTime: 2025-01-22 14:05:55
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\views\home\widget\conversation_item.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/im/elem.dart';
import 'package:flutter_chat/utils/log_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';

class ConversationItemSlidable extends StatefulWidget {
  V2TimConversation conversation;
  int index;
  void Function() onTap;
  void Function() onDelete;
  void Function() onTop;
  ConversationItemSlidable({
    super.key,
    required this.index,
    required this.conversation,
    required this.onTap,
    required this.onDelete,
    required this.onTop,
  });

  @override
  State<ConversationItemSlidable> createState() =>
      _ConversationItemSlidableState();
}

class _ConversationItemSlidableState extends State<ConversationItemSlidable> {
  var isDelete = false;

  List<Widget> buildAction() {
    Widget deleteAction = SlidableAction(
      flex: 1,
      onPressed: (BuildContext context) {
        if (isDelete) {
          // widget.onDelete();
          Log.info('删除并清空聊天记录');
        } else {
          isDelete = true;
          setState(() {});
        }
      },
      backgroundColor: Color(0xFFFE4A49),
      foregroundColor: Colors.white,
      autoClose: isDelete,
      label: isDelete ? '删除并清空聊天记录' : '删除',
    );
    Widget topAction = SlidableAction(
      flex: 1,
      onPressed: (BuildContext context) {
        widget.onTop();
      },
      backgroundColor: Color.fromARGB(255, 73, 200, 255),
      foregroundColor: Colors.white,
      autoClose: true,
      padding: EdgeInsets.all(0.0),
      label: widget.conversation.isPinned == true ? '取消置顶' : '置顶',
    );
    if (isDelete) {
      return [deleteAction];
    }
    return [topAction, deleteAction];
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(widget.index),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: buildAction(),
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ConversationItem(
        conversation: widget.conversation,
        onTap: widget.onTap,
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  V2TimConversation conversation;
  void Function() onTap;
  ConversationItem({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        color:
            conversation.isPinned == true ? Colors.grey.shade300 : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${conversation.showName}',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  ImMessage.formatConversationMessage(
                    conversation.lastMessage!,
                  ),
                  style: TextStyle(fontSize: 16.sp),
                ),
                Text(
                  '${conversation.lastMessage?.timestamp}',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
