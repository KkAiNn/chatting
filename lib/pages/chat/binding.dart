import 'package:flutter_chat/providers/im/conversation.dart';
import 'package:get/get.dart';
import 'logic.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatLogic());
    Get.lazyPut(() => ConversationController());
  }
}
