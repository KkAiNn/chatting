/*
 * @Author: wurangkun
 * @Date: 2024-10-21 17:02:27
 * @LastEditTime: 2025-01-21 18:04:02
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\views\user\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/view/common_view.dart';
import 'package:flutter_chat/layout/page/index.dart';
import 'package:flutter_chat/pages/tabbar/views/user/logic.dart';
import 'package:get/get.dart';

import '../../../../routes/index.dart';
import '../../../../widgets/card.dart';

class UserDemo extends BaseCommonView<UserLogic> {
  UserDemo({super.key});
  final logic = Get.find<UserLogic>();

  @override
  Widget buildContent() {
    return GetBuilder<UserLogic>(
      builder:
          (_) => creatCommonView(
            logic,
            (con) => Column(
              children: [
                const Text('UserDemo'),
                AppCard(
                  child: const Text('UserDemo Page'),
                  onTap: () {
                    Get.toNamed(RouteName.DEMOLIST);
                  },
                ),
              ],
            ),
          ),
    );
  }
}
