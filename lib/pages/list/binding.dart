/*
 * @Author: wurangkun
 * @Date: 2024-10-22 11:15:56
 * @LastEditTime: 2024-12-17 15:15:14
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\list\list_binding.dart
 * @Description: 
 */
import 'package:flutter_cli/pages/list/logic.dart';
import 'package:get/get.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ListController());
    Get.lazyPut<ListLogic>(() => ListLogic());
  }
}
