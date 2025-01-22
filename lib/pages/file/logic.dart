import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';

class FileLogic extends BaseCommonController {
  @override
  void initData() {
    netState = NetState.dataSussessState;
    update();
    // netState = NetState.loadingState;
    // Future.delayed(const Duration(seconds: 2), () {
    //   netState = NetState.dataSussessState;
    //   print('data success');
    //   update();
    // });
  }

  @override
  void loadMore() {
    // TODO: implement loadMore
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
    print('hide');
  }

  @override
  void refreshData() {
    // TODO: implement refreshData
  }
}
