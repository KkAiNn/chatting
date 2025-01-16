/*
 * @Author: wurangkun
 * @Date: 2024-12-17 09:58:18
 * @LastEditTime: 2024-12-17 14:58:43
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\base\view\common_view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/controller/controller.dart';
import 'package:flutter_chat/base/view/view.dart';
import 'package:flutter_chat/widgets/empty_status.dart';
import 'package:flutter_chat/widgets/loading_wdget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/common_controller.dart';

typedef BodyBuilder = Widget Function(BaseCommonController baseState);

// ignore: must_be_immutable
abstract class BaseCommonView<T> extends BaseView<T> {
  BaseCommonView({super.key});

  /// 创建空视图 (子视图实现的话 Widget就是子视图实现的)
  Widget creatEmptyWidget() {
    return const EmptyStatusWidget(emptyType: EmptyStatusType.noMessage);
  }

  /// 创建错误视图 (子视图实现的话 Widget就是子视图实现的)
  Widget creatFailWidget(BaseCommonController controller) {
    return EmptyStatusWidget(
      emptyType: EmptyStatusType.fail,
      refreshTitle: '重新加载',
      width: 1.sw,
      height: 1.sh,
      onTap: () {
        /// 重新请求数据
        controller.getnetworkdata(controller.configNetWorkParmas());
      },
    );
  }

  /// 创建页面主视图
  Widget creatCommonView(BaseCommonController controller, BodyBuilder builder) {
    debugPrint('creatCommonView');
    if (controller.netState == NetState.loadingState) {
      /// loading 不会有这个状态,只是写一个这样的判断吧(控制器里面已经封装好了单例了,防止在网络层直接操作控制不了loading的场景)
      return const LoadingWidget();
    } else if (controller.netState == NetState.emptyDataState) {
      /// 返回站位视图
      return creatEmptyWidget();
    } else if (controller.netState == NetState.errorshowRelesh) {
      /// 返回站位刷新视图
      return creatFailWidget(controller);
    } else if (controller.netState == NetState.dataSussessState) {
      return builder(controller);
    } else if (controller.netState == NetState.initializeState) {
      return const SizedBox();
    } else {
      return const Center(child: Text('未知情况,待排查'));
    }
  }
}
