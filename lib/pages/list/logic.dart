import 'package:flutter/material.dart';
import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';

class ListLogic extends BaseCommonController {
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
