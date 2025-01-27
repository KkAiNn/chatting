/*
 * @Author: wurangkun
 * @Date: 2025-01-16 15:50:05
 * @LastEditTime: 2025-01-21 15:09:32
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\splash\binding.dart
 * @Description: 
 */
import 'package:flutter_chat/base/theme/controller.dart';
import 'package:flutter_chat/pages/login/logic.dart';
import 'package:flutter_chat/pages/tabbar/logic.dart';
import 'package:flutter_chat/providers/im/im.dart';
import 'package:flutter_chat/splash/logic.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarLogic>(() => TabbarLogic());
    Get.lazyPut<LoginLogic>(() => LoginLogic());
    Get.lazyPut<AppLogic>(() => AppLogic());
    Get.lazyPut<ImController>(() => ImController());
    Get.put(ThemeController(), permanent: true);
  }
}
