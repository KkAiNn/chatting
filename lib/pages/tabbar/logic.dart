/*
 * @Author: wurangkun
 * @Date: 2024-10-22 10:23:35
 * @LastEditTime: 2025-01-16 17:19:01
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\logic.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_cli/base/controller/common_controller.dart';
import 'package:flutter_cli/base/controller/controller.dart';
import 'package:get/get.dart';

class MainState {
  late RxInt index;

  MainState() {
    index = 0.obs;
  }
}

class TabbarLogic extends BaseCommonController {
  final index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print('object');
    // if (controller != null) {
    //   controller.jumpToPage(index.value);
    // }
  }

  @override
  void initData() {
    // netState = NetState.dataSussessState;
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void loadMore() {
    // TODO: implement loadMore
  }

  @override
  void refreshData() {
    // TODO: implement refreshData
  }
}
