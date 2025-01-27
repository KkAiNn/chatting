/*
 * @Author: wurangkun
 * @Date: 2025-01-16 13:50:17
 * @LastEditTime: 2025-01-21 10:48:25
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\login\binding.dart
 * @Description: 
 */
import 'package:flutter_chat/pages/login/logic.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ListController());
    Get.lazyPut<LoginLogic>(() => LoginLogic());
  }
}
