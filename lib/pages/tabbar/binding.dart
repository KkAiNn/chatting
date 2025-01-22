/*
 * @Author: wurangkun
 * @Date: 2024-10-22 10:24:49
 * @LastEditTime: 2024-12-17 15:19:37
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\pages\home\homeBinding.dart
 * @Description: 
 */
import 'package:flutter_chat/pages/file/logic.dart';
import 'package:flutter_chat/pages/tabbar/views/home/logic.dart';
import 'package:flutter_chat/pages/tabbar/logic.dart';
import 'package:get/get.dart';

import 'views/setting/logic.dart';

class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarLogic>(() => TabbarLogic());
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<FileLogic>(() => FileLogic());
    Get.lazyPut<SettingLogic>(() => SettingLogic());
  }
}
