/*
 * @Author: wurangkun
 * @Date: 2024-10-21 09:53:27
 * @LastEditTime: 2025-01-21 14:03:38
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/layout/tabbar/index.dart';
import 'package:flutter_chat/pages/file/index.dart';
import 'package:flutter_chat/pages/tabbar/views/home/index.dart';
import 'package:flutter_chat/pages/tabbar/views/setting/index.dart';
import 'package:flutter_chat/pages/tabbar/logic.dart';
import 'package:flutter_chat/widgets/pop_scope.dart';
import 'package:get/get.dart';

class TabbarPage extends GetView<TabbarLogic> {
  TabbarPage({super.key});

  final logic = Get.find<TabbarLogic>();
  final PageController _controller = PageController(initialPage: 0);

  final List<Widget> pageList = [HomePage(), FilePage(), SettingPage()];

  void _onTap(index) {
    _controller.jumpToPage(index);
    logic.index.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabbarLogic>(
      builder:
          (_) => AppPopScope(
            child: Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      children: pageList,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Obx(
                () => myTabBar(context, logic.index.value, _onTap),
              ),
            ),
          ),
    );
  }
}
