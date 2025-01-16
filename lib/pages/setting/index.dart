/*
 * @Author: wurangkun
 * @Date: 2024-10-21 15:05:09
 * @LastEditTime: 2025-01-16 17:12:58
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\setting\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/view/common_view.dart';
import 'package:flutter_chat/layout/page/index.dart';
import 'package:flutter_chat/splash/logic.dart';
import 'package:flutter_chat/widgets/card.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SettingPage extends BaseCommonView<SettingLogic> {
  SettingPage({super.key});
  final logic = Get.find<SettingLogic>();
  final appLogic = Get.find<AppLogic>();
  @override
  String? get navTitle => '设置';

  @override
  Widget buildContent() {
    return creatCommonView(
      logic,
      (con) => MyPage(
        children: [
          const Text('setting Page'),
          AppCard(child: const Text('Api Page'), onTap: () {}),
          AppCard(
            child: const Text('logout'),
            onTap: () {
              appLogic.logout();
            },
          ),
        ],
      ),
    );
  }
}
