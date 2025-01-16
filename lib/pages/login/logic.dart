/*
 * @Author: wurangkun
 * @Date: 2025-01-16 13:50:12
 * @LastEditTime: 2025-01-16 16:05:41
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\login\logic.dart
 * @Description: 
 */
import 'package:flutter_cli/base/controller/common_controller.dart';
import 'package:flutter_cli/base/controller/controller.dart';
import 'package:flutter_cli/models/user_model/user_model.dart';
import 'package:flutter_cli/splash/logic.dart';
import 'package:get/get.dart';

class LoginLogic extends BaseCommonController {
  @override
  void initData() {
    netState = NetState.dataSussessState;
    update();
  }

  void login() {
    var logic = Get.put(AppLogic());
    UserVo user = UserVo(token: '123456', userName: 'wurangkun');
    logic.login(user);
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
