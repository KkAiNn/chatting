/*
 * @Author: wurangkun
 * @Date: 2025-01-16 15:36:57
 * @LastEditTime: 2025-01-17 16:07:31
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\splash\splash.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/login/index.dart';
import 'package:flutter_chat/pages/tabbar/index.dart';
import 'package:flutter_chat/splash/logic.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLogic>(
      builder: (logic) {
        if (logic.loginState.value == true) {
          //已登录
          return TabbarPage();
        } else {
          // 未登录
          return Login();
        }
      },
    );
  }
}
