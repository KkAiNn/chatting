/*
 * @Author: wurangkun
 * @Date: 2024-12-17 11:22:11
 * @LastEditTime: 2024-12-18 13:46:06
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\pages\home\logic.dart
 * @Description: 
 */
import 'package:flutter_chat/base/controller/common_controller.dart';
import 'package:flutter_chat/base/controller/controller.dart';

class HomeLogic extends BaseCommonController {
  @override
  void initData() {
    netState = NetState.dataSussessState;
    print('in initData');
    update();
  }

  @override
  void loadMore() {}

  @override
  void onHidden() {}

  @override
  void refreshData() {}
}
