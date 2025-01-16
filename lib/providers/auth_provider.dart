/*
 * @Author: wurangkun
 * @Date: 2025-01-16 14:23:40
 * @LastEditTime: 2025-01-16 16:48:56
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\providers\auth_provider.dart
 * @Description: 
 */
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cli/models/user_model/user_model.dart';
import 'package:sp_util/sp_util.dart';
// import 'package:tfapp/user_manager/user_token_entity.dart';

const String tokenKey = 'userToken';

class UserManager {
  static final UserManager _userManager = UserManager._internal();
  static UserManager get instance => UserManager();

  factory UserManager() {
    return _userManager;
  }

  UserVo? user;

  UserManager._internal();

  bool get isLogin {
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  UserVo get tokenEntity {
    return user!;
  }

  /// 保存token到内存和本地
  saveUserToken(UserVo entity) {
    user = entity;
    SpUtil.putObject(tokenKey, entity);
  }

  /// 加载本地缓存token
  UserVo? loadLocalToken() {
    UserVo? entity = SpUtil.getObj(
      tokenKey,
      (v) => UserVo.fromJson(v as Map<String, dynamic>),
    );
    user = entity;
    return entity;
  }

  /// 登出
  logout() {
    user = null;
    SpUtil.remove(tokenKey);
  }
}
