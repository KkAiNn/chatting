/*
 * @Author: wurangkun
 * @Date: 2024-12-18 13:52:00
 * @LastEditTime: 2024-12-18 13:52:08
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\file\binding.dart
 * @Description: 
 */
import 'package:flutter_cli/pages/home/logic.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }
}
