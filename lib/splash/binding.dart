/*
 * @Author: wurangkun
 * @Date: 2025-01-16 15:50:05
 * @LastEditTime: 2025-01-16 15:51:07
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\splash\binding.dart
 * @Description: 
 */
import 'package:flutter_cli/base/theme/controller.dart';
import 'package:flutter_cli/pages/tabbar/logic.dart';
import 'package:flutter_cli/splash/logic.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarLogic>(() => TabbarLogic());
    Get.lazyPut<AppLogic>(() => AppLogic());
    Get.put(ThemeController(), permanent: true);
  }
}
