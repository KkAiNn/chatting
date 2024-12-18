/*
 * @Author: wurangkun
 * @Date: 2024-10-22 10:23:35
 * @LastEditTime: 2024-12-18 13:24:21
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\tabbar\logic.dart
 * @Description: 
 */
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
  void initData() {
    netState = NetState.dataSussessState;
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
