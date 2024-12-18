/*
 * @Author: wurangkun
 * @Date: 2024-10-21 09:50:07
 * @LastEditTime: 2024-12-18 13:46:52
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\routes\index.dart
 * @Description: 
 */
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
}

abstract class AppRouter {
  static var pages = [
    GetPage(
        name: RouteName.INITAL,
        page: () => TabbarPage(),
        binding: TabbarBinding()),
    GetPage(
        name: RouteName.DEMOLIST,
        page: () => ListDemo(),
        binding: ListBinding()),
    GetPage(
        name: RouteName.USER, page: () => UserDemo(), binding: UserBinding())
  ];
}
