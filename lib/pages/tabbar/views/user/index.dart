/*
 * @Author: wurangkun
 * @Date: 2024-10-21 17:02:27
 * @LastEditTime: 2024-12-18 13:26:18
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\pages\user\index.dart
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
            (con) => MyPage(
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
