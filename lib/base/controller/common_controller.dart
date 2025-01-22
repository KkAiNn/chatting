/*
 * @Author: wurangkun
 * @Date: 2024-12-17 09:58:52
 * @LastEditTime: 2025-01-21 18:37:01
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\base\controller\common_controller.dart
 * @Description: 
 */
import 'package:flutter_chat/base/list/abstract_network.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import '../../base/abstract_network.dart';
import './controller.dart';

///  普通视图控制器
abstract class BaseCommonController extends BaseController
    with AbstractListNetWork {
  @override
  void getnetworkdata(Map<String, dynamic>? info) {}

  @override
  Map<String, dynamic> configNetWorkParmas() {
    throw UnimplementedError();
  }
}
