/*
 * @Author: wurangkun
 * @Date: 2024-10-21 09:50:07
 * @LastEditTime: 2025-01-15 10:09:00
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\routes\index.dart
 * @Description: 
 */
import 'package:flutter_cli/pages/file/mannager/binding.dart';
import 'package:flutter_cli/pages/file/mannager/index.dart';
import 'package:flutter_cli/pages/tabbar/binding.dart';
import 'package:flutter_cli/pages/tabbar/index.dart';
import 'package:flutter_cli/pages/list/index.dart';
import 'package:flutter_cli/pages/list/binding.dart';
import 'package:flutter_cli/pages/user/index.dart';
import 'package:flutter_cli/pages/user/binding.dart';
import 'package:get/get.dart';

abstract class RouteName {
  static String INITAL = '/';
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
      page: () => TabbarPage(),
      binding: TabbarBinding(),
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
