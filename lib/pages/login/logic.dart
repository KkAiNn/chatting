/*
 * @Author: wurangkun
 * @Date: 2025-01-16 13:50:12
 * @LastEditTime: 2025-01-21 13:07:22
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\login\logic.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';
import 'package:flutter_chat/base/form/text_filed/text_filed.dart';
import 'package:flutter_chat/models/user_model/user_model.dart';
import 'package:flutter_chat/splash/logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FormModal {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  String value;

  FormModal({
    required this.value,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    this.validator,
  });
}

class LoginState {
  final UserVo user = UserVo();
  final Map<String, FormModal> form = {
    'username': FormModal(
      value: '',
      label: "用户名",
      hintText: "请输入用户名",
      controller: TextEditingController(),
      keyboardType: TextInputType.text,
      validator: (user) => user!.isEmpty ? "用户名不能为空" : null,
    ),
    'password': FormModal(
      value: '',
      label: "密码",
      hintText: "请输入密码",
      controller: TextEditingController(),
      keyboardType: TextInputType.visiblePassword,
      validator: (user) => user!.isEmpty ? "密码不能为空" : null,
      obscureText: true,
    ),
  };
}

class LoginLogic extends BaseCommonController {
  final LoginState state = LoginState();
  final formKey = GlobalKey<FormState>();

  void onInit() {
    super.onInit();
    netState = NetState.dataSussessState;
  }

  @override
  void initData() {
    print('login initData');
    netState = NetState.dataSussessState;
    update();
  }

  void login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var params = state.form.map((e, val) {
        return MapEntry(e, val.value);
      });
      print(params);
      // 执行登录操作
      print(params['username']);
      print(params['password']);
      // 如果表单验证成功
      // 执行提交操作
      var logic = Get.put(AppLogic());
      UserVo user = UserVo(token: Uuid().v4(), userName: params['username']);
      logic.login(user);
      update();
    }
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

  Widget buildForm() {
    List<Widget> formFiled = [];
    state.form.forEach((e, val) {
      formFiled.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: MyTextFiled(
            hintText: val.hintText,
            controller: val.controller,
            obscureText: val.obscureText,
            validator: val.validator,
            onChanged: (value) {
              val.value = value;
            },
          ),
        ),
      );
    });
    Widget form = Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(children: formFiled),
    );
    return form;
    // return state.form.map((e) => {
    //   return MyTextFiled();
    // }).toList();
  }
}
