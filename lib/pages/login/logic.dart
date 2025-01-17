/*
 * @Author: wurangkun
 * @Date: 2025-01-16 13:50:12
 * @LastEditTime: 2025-01-17 16:59:28
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\login\logic.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';
import 'package:flutter_chat/models/user_model/user_model.dart';
import 'package:flutter_chat/splash/logic.dart';
import 'package:get/get.dart';

class LoginState {
  final UserVo user = UserVo();
  final form = {'email': '', 'password': ''};
}

class LoginLogic extends BaseCommonController {
  final TextEditingController emailController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    print('object');
  }

  @override
  void initData() {
    netState = NetState.dataSussessState;
    update();
  }

  void login() {
    var logic = Get.put(AppLogic());
    UserVo user = UserVo(token: '123456', userName: 'wurangkun');
    logic.login(user);
    update();
  }

  @override
  void loadMore() {
    // TODO: implement loadMore
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void refreshData() {
    // TODO: implement refreshData
  }
}
