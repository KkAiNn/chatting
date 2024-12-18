import 'package:flutter_cli/base/controller/common_controller.dart';
import 'package:flutter_cli/base/controller/controller.dart';

class SettingLogic extends BaseCommonController {
  @override
  void initData() {
    netState = NetState.loadingState;
    Future.delayed(const Duration(seconds: 2), () {
      netState = NetState.dataSussessState;
      print('data success');
      update();
    });
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
