/*
 * @Author: wurangkun
 * @Date: 2024-12-18 13:52:00
 * @LastEditTime: 2024-12-18 13:52:54
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\setting\binding.dart
 * @Description: 
 */
import 'package:get/get.dart';

import 'logic.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingLogic>(() => SettingLogic());
  }
}
