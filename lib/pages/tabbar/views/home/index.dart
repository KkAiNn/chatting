/*
 * @Author: wurangkun
 * @Date: 2024-10-21 15:04:44
 * @LastEditTime: 2025-01-16 16:27:59
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\views\home\index.dart
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_cli/base/view/common_view.dart';
import 'package:flutter_cli/constants/gap.dart';
import 'package:flutter_cli/layout/page/index.dart';
import 'package:flutter_cli/models/user_model/user_model.dart';
import 'package:flutter_cli/pages/tabbar/views/home/logic.dart';
import 'package:flutter_cli/providers/auth_provider.dart';
import 'package:flutter_cli/routes/index.dart';
import 'package:flutter_cli/widgets/cell.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends BaseCommonView<HomeLogic> {
  HomePage({super.key});
  final logic = Get.find<HomeLogic>();
  @override
  bool? get isHiddenNav => false;

  @override
  String? get navTitle => 'home';
  GlobalKey repaintKey = GlobalKey();
  @override
  // TODO: implement rightActionList
  List<Widget>? get rightActionList => [
    IconButton(
      onPressed: () {
        Get.isDarkMode
            ? Get.changeThemeMode(ThemeMode.light)
            : Get.changeThemeMode(ThemeMode.dark);
      },
      icon:
          Get.isDarkMode
              ? const Icon(Icons.sunny)
              : const Icon(Icons.nightlight_round),
    ),
  ];

  @override
  Widget buildContent() {
    return GetBuilder<HomeLogic>(
      builder:
          (_) => creatCommonView(
            logic,
            (con) => MyPage(
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.DEMOLIST);
                    UserVo? entity = UserManager.instance.loadLocalToken();
                    print(entity?.token);
                  },
                  child: Card(
                    child: Container(
                      width: 375.w,
                      height: 300.h,
                      alignment: Alignment.center,
                      child: const Text('data'),
                    ),
                  ),
                ),
                Gaps.vGap12,
                AppCell(child: const Text('data'), onTap: () {}),
              ],
            ),
          ),
    );
  }
}
