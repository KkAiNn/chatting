/*
 * @Author: wurangkun
 * @Date: 2024-10-22 10:24:49
 * @LastEditTime: 2024-12-17 15:19:37
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\home\homeBinding.dart
 * @Description: 
 */
import 'package:flutter_cli/pages/tabbar/views/file/logic.dart';
import 'package:flutter_cli/pages/tabbar/views/home/logic.dart';
import 'package:flutter_cli/pages/tabbar/logic.dart';
import 'package:get/get.dart';

import '../setting/logic.dart';

class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarLogic>(() => TabbarLogic());
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<FileLogic>(() => FileLogic());
    Get.lazyPut<SettingLogic>(() => SettingLogic());
  }
}
