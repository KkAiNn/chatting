/*
 * @Author: wurangkun
 * @Date: 2025-01-16 15:44:01
 * @LastEditTime: 2025-01-16 17:23:46
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\splash\logic.dart
 * @Description: 
 */
import 'package:flutter_chat/models/user_model/user_model.dart';
import 'package:flutter_chat/pages/tabbar/logic.dart';
import 'package:flutter_chat/pages/tabbar/views/home/logic.dart';
import 'package:flutter_chat/providers/auth_provider.dart';
import 'package:get/get.dart';

class AppLogic extends GetxController {
  var user = UserVo().obs;
  var loginState = false.obs;
  logout() {
    loginState.value = false;
    UserManager.instance.logout();
    update();
  }

  /*用户token同步*/
  login(UserVo userEntity) {
    user.value = userEntity;
    loginState.value = true;
    UserManager.instance.saveUserToken(userEntity);

    /// 首页的用户状态需求更新
    TabbarLogic tabbarLogic = Get.find<TabbarLogic>();
    HomeLogic homeLogic = Get.find<HomeLogic>();
    tabbarLogic.index.value = 0;
    // homeLogic.state.refreshController.requestRefresh();
    update();
  }

  /*加载本地用户Token*/
  localUserToken() {
    UserVo? entity = UserManager.instance.loadLocalToken();
    if (entity != null) {
      user.value = entity;
      loginState.value = true;
      update();
    }
  }

  loadNetUserInfo() {
    if (loginState.value == true) {
      // asyncRequestNetwork<UserEntity>(
      //   '',
      //   onSuccess: (data) {
      //     /// 用户登录态未过期可以接着使用
      //     tokenEntiy.value = data!;
      //     loginState.value = true;
      //     update();
      //   },
      //   onError: (code, msg) {},
      // );
    }
  }

  @override
  void onInit() {
    super.onInit();
    localUserToken();
  }
}
