/*
 * @Author: wurangkun
 * @Date: 2024-10-21 12:17:57
 * @LastEditTime: 2024-10-21 13:39:01
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\utils\loading.dart
 * @Description: 
 */

import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading() {
  EasyLoading.show();
}

void hideLoading() {
  EasyLoading.dismiss();
}

void showToast(
  String msg, {
  EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.center,
}) {
  EasyLoading.showToast(msg, toastPosition: toastPosition);
}
