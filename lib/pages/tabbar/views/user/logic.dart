/*
 * @Author: wurangkun
 * @Date: 2025-01-16 12:41:44
 * @LastEditTime: 2025-01-16 15:35:15
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\tabbar\views\user\logic.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';

class UserLogic extends BaseCommonController {
  void onGoToDetail() {
    // Get.toNamed(RouteNames.detail);
  }

  @override
  void initData() {
    debugPrint("initData api");
    netState = NetState.dataSussessState;
    update();
  }

  @override
  void loadMore() {
    // TODO: implement loadMore
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void refreshData() {
    // TODO: implement refreshData
  }
}
