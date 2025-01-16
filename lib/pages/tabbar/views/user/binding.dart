/*
 * @Author: wurangkun
 * @Date: 2024-10-22 11:15:56
 * @LastEditTime: 2024-12-18 13:25:57
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\user\binding.dart
 * @Description: 
 */
import 'package:flutter_cli/pages/tabbar/views/user/logic.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ListController());
    Get.lazyPut<UserLogic>(() => UserLogic());
  }
}
