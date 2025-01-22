/*
 * @Author: wurangkun
 * @Date: 2025-01-21 17:32:16
 * @LastEditTime: 2025-01-22 13:15:00
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\providers\im\sendMessage.dart
 * @Description: 
 */
import 'package:flutter_chat/utils/log_util.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_priority_enum.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_msg_create_info_result.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

class Sendmessage {
  // Future<V2TimValueCallback<V2TimMessage>> sendMessage({
  //   required String id,
  //   required String receiver,
  //   required String groupID,
  //   int priority = 0,
  //   bool onlineUserOnly = false,
  //   bool needReadReceipt = false,
  //   bool isExcludedFromUnreadCount = false,
  //   bool isExcludedFromLastMessage = false,
  //   Map<String, dynamic>? offlinePushInfo,
  //   String? cloudCustomData,
  //   String? localCustomData,
  // }) {

  // }
  createTextMessage() async {
    // 创建文本消息
    V2TimValueCallback<V2TimMsgCreateInfoResult> createTextMessageRes =
        await TencentImSDKPlugin.v2TIMManager
            .getMessageManager()
            .createTextMessage(
              text: "test", // 文本信息
            );
    Log.info(createTextMessageRes.code);
    Log.info(createTextMessageRes.data?.toLogString());
    if (createTextMessageRes.code == 0) {
      // 文本信息创建成功
      String? id = createTextMessageRes.data?.id;
      // 发送文本消息
      // 在sendMessage时，若只填写receiver则发个人用户单聊消息
      //                 若只填写groupID则发群组消息
      //                 若填写了receiver与groupID则发群内的个人用户，消息在群聊中显示，只有指定receiver能看见
      V2TimValueCallback<V2TimMessage> sendMessageRes = await TencentImSDKPlugin
          .v2TIMManager
          .getMessageManager()
          .sendMessage(
            id: id!, // 创建的messageid
            receiver: "test-user1", // 接收人id
            groupID: "", // 接收群组id
            priority: MessagePriorityEnum.V2TIM_PRIORITY_DEFAULT, // 消息优先级
            onlineUserOnly:
                false, // 是否只有在线用户才能收到，如果设置为 true ，接收方历史消息拉取不到，常被用于实现“对方正在输入”或群组里的非重要提示等弱提示功能，该字段不支持 AVChatRoom。
            isExcludedFromUnreadCount: true, // 发送消息是否计入会话未读数
            isExcludedFromLastMessage: true, // 发送消息是否计入会话 lastMessage
            needReadReceipt:
                true, // 消息是否需要已读回执（只有 Group 消息有效，6.1 及以上版本支持，需要您购买旗舰版或企业版套餐）
            // offlinePushInfo: OfflinePushInfo(), // 离线推送时携带的标题和内容
            cloudCustomData: "", // 消息云端数据，消息附带的额外的数据，存云端，消息的接收者可以访问到
            localCustomData:
                "", // 消息本地数据，消息附带的额外的数据，存本地，消息的接收者不可以访问到，App 卸载后数据丢失
          );
      Log.info('sendMessageRes.code ${sendMessageRes.code}');
      Log.info(sendMessageRes.data?.toLogString());
      if (sendMessageRes.code == 0) {
        // 发送成功
      }
    }
  }
}
