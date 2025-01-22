import 'dart:convert' as convert;

import 'package:flutter_chat/enum/im.dart';
import 'package:flutter_chat/utils/log_util.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';

class TextContent {
  String content;

  TextContent(this.content);
}

class ImMessage {
  formatMessage(V2TimMessage msg) {}
  static String formatConversationMessage(V2TimMessage msg) {
    if (msg.elemType == ImElemType.text.value) {
      Map<String, dynamic> content = convert.jsonDecode(
        msg.textElem?.text ?? '{}',
      );
      Map<String, dynamic> text = convert.jsonDecode(content['Text'] ?? '{}');
      return text['content'] ?? '暂无消息';
    }

    if (msg.elemType == ImElemType.image.value) {
      return '[图片]';
    }
    if (msg.elemType == ImElemType.sound.value) {
      return '[语音]';
    }
    if (msg.elemType == ImElemType.video.value) {
      return '[视频]';
    }
    if (msg.elemType == ImElemType.file.value) {
      return '[文件]';
    }
    if (msg.elemType == ImElemType.custom.value) {
      return '[消息]';
    }

    return '暂无消息';
  }
}
