/*
 * @Author: wurangkun
 * @Date: 2024-10-21 17:02:27
 * @LastEditTime: 2024-12-17 18:24:27
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\list\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_cli/base/view/common_view.dart';
import 'package:flutter_cli/pages/list/logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/index.dart';
import '../../widgets/card.dart';

class ListDemo extends BaseCommonView<ListLogic> {
  ListDemo({super.key});
  final logic = Get.find<ListLogic>();

  @override
  Widget buildContent() {
    return GetBuilder<ListLogic>(
      builder:
          (_) => creatCommonView(
            logic,
            (con) => Column(
              children: [
                const Text('ListDemo'),
                const Text('ListDemo2'),
                AppCard(
                  child: SizedBox(
                    height: 1.5.sh,
                    child: const Text('Api Page'),
                  ),
                  onTap: () {
                    Get.toNamed(RouteName.USER);
                  },
                ),
              ],
            ),
          ),
    );
  }
}
