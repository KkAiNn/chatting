/*
 * @Author: wurangkun
 * @Date: 2024-12-18 13:52:00
 * @LastEditTime: 2024-12-18 13:52:08
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\pages\file\binding.dart
 * @Description: 
 */
import 'package:flutter_chat/pages/tabbar/views/file/logic.dart';
import 'package:get/get.dart';

class FileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FileLogic>(() => FileLogic());
  }
}
