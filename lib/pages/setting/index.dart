/*
 * @Author: wurangkun
 * @Date: 2024-10-21 15:05:09
 * @LastEditTime: 2024-12-18 13:48:38
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\file\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_cli/base/view/common_view.dart';
import 'package:flutter_cli/layout/page/index.dart';
import 'package:flutter_cli/widgets/card.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SettingPage extends BaseCommonView<SettingLogic> {
  SettingPage({super.key});
  final logic = Get.find<SettingLogic>();

  @override
  String? get navTitle => '设置';

  @override
  Widget buildContent() {
    return creatCommonView(
        logic,
        (con) => MyPage(children: [
              const Text('setting Page'),
              AppCard(
                child: const Text('Api Page'),
                onTap: () {},
              )
            ]));
  }
}
