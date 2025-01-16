/*
 * @Author: wurangkun
 * @Date: 2024-10-21 09:50:07
 * @LastEditTime: 2025-01-16 15:49:23
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\routes\index.dart
 * @Description: 
 */
import 'package:flutter_chat/pages/tabbar/views/file/mannager/binding.dart';
import 'package:flutter_chat/pages/tabbar/views/file/mannager/index.dart';
import 'package:flutter_chat/pages/login/binding.dart';
import 'package:flutter_chat/pages/login/index.dart';
import 'package:flutter_chat/pages/tabbar/binding.dart';
import 'package:flutter_chat/pages/tabbar/index.dart';
import 'package:flutter_chat/pages/list/index.dart';
import 'package:flutter_chat/pages/list/binding.dart';
import 'package:flutter_chat/pages/tabbar/views/user/index.dart';
import 'package:flutter_chat/pages/tabbar/views/user/binding.dart';
import 'package:flutter_chat/splash/splash.dart';
import 'package:get/get.dart';

abstract class RouteName {
  static String INITAL = '/';
  static String SplashPage = '/splash';
  static String HOME = '/home';
  static String LOGIN = '/login';
  static String USER = '/user';
  static String REGISTER = '/register';
  static String DEMOLIST = '/list';
  static String FileManager = '/fileManager';
  static String ImageViewer = '/preview_image';
}

abstract class AppRouter {
  static var pages = [
    GetPage(
      name: RouteName.INITAL,
      page: () => SplashPage(),
      binding: TabbarBinding(),
    ),
    GetPage(
      name: RouteName.SplashPage,
      page: () => SplashPage(),
      // binding: LoginBinding(),
      // transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.DEMOLIST,
      page: () => ListDemo(),
      binding: ListBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.USER,
      page: () => UserDemo(),
      binding: UserBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.FileManager,
      page: () => FileMannagerPage(),
      binding: FileMannagerBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    // GetPage(
    //   name: RouteName.ImageViewer,
    //   page: () => const ImageViewer(),
    //   transition: Transition.fade,
    // ),
  ];
}
