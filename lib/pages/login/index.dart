/*
 * @Author: wurangkun
 * @Date: 2025-01-16 13:48:52
 * @LastEditTime: 2025-01-16 17:26:00
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\login\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/models/user_model/user_model.dart';

class Login extends StatelessWidget {
  final void Function(UserVo user)? onTap;
  const Login({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final UserVo user = UserVo(token: '123456', userName: 'wurangkun');
    void onTapUser() {
      print('onTapUser');
    }

    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () => onTap == null ? onTapUser : onTap!(user),
          child: const Text('登录'),
        ),
      ),
    );
  }
}
