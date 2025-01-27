import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/base/controller/controller.dart';
import 'package:flutter_chat/base/controller/list_controller.dart';
import 'package:flutter_chat/base/view/view.dart';
import 'package:flutter_chat/widgets/empty_status.dart';
import 'package:flutter_chat/widgets/loading_wdget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef BodyBuilder = Widget Function(BaseListController baseState);

abstract class BaseListView<T> extends BaseView<T> {
  BaseListView({Key? key}) : super(key: key);

  /// 创建空视图 (子视图实现的话 Widget就是子视图实现的)
  Widget creatEmptyWidget() {
    return const EmptyStatusWidget(emptyType: EmptyStatusType.noMessage);
  }

  /// 创建错误视图 (子视图实现的话 Widget就是子视图实现的)
  Widget creatFailWidget(BaseListController controller) {
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

  /// 创建列表视图
  Widget creatRefresherListView(
    BaseListController controller,
    BodyBuilder builder, {
    bool? enablePullUp,
    bool? enablePullDown,
    bool enableLoadMoreVibrate = true,
  }) {
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
      return RefreshConfiguration(
        headerTriggerDistance: 10,
        footerTriggerDistance: 0,
        enableBallisticLoad: false,
        headerBuilder: () => createCustomHeader(),
        footerBuilder: () => createFooter(),
        enableLoadMoreVibrate: enableLoadMoreVibrate,
        child: SmartRefresher(
          controller: controller.refreshController,

          /// 是否显示下拉
          enablePullUp: enablePullUp ?? true,

          /// 是否显示上拉
          enablePullDown: enablePullDown ?? true,

          /// 刷新回调方法
          onRefresh: () async {
            controller.refreshData();
          },

          /// 加载下一页回调
          onLoading: () async {
            controller.loadMore();
          },
          child: builder(controller),
        ),
      );
    } else if (controller.netState == NetState.initializeState) {
      return const SizedBox();
    } else {
      return const Center(child: Text('未知情况,待排查'));
    }
  }

  /// 修改头视图配置
  ClassicHeader createHeader() {
    return ClassicHeader(
      textStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
      refreshingText: '正在刷新...',
      releaseText: '刷新成功',
      completeText: '刷新成功',
      failedText: '刷新失败',
      idleText: '刷新中',
      height: 40,
    );
  }

  /// 自定义头视图配置
  CustomHeader createCustomHeader() {
    Widget body = _prompt("下拉刷新");
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        if (mode == RefreshStatus.canRefresh) {
          body = _header("下拉可以刷新");
        } else if (mode == RefreshStatus.refreshing) {
          body = _header("刷新中...");
        } else if (mode == RefreshStatus.failed) {
          body = _header("刷新失败");
        } else {
          body = _header("刷新成功");
        }
        return body;
      },
    );
  }

  /// 头视图样式
  Widget _header(String showText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CupertinoActivityIndicator(radius: 10, color: Colors.black45),
        SizedBox(width: 8.w),
        Text(
          showText,
          style: TextStyle(color: const Color(0xFF979797), fontSize: 14.sp),
        ),
      ],
    );
  }

  /// 修改尾视图配置
  CustomFooter createFooter() {
    Widget body = _prompt("上拉加载更多");
    return CustomFooter(
      builder: (context, mode) {
        if (mode == LoadStatus.idle) {
          body = _prompt("上拉加载更多");
        } else if (mode == LoadStatus.loading) {
          body = _prompt("加载中...");
        } else if (mode == LoadStatus.failed) {
          body = _prompt("加载失败");
        } else if (mode == LoadStatus.canLoading) {
          body = _prompt("松手加载更多");
        } else {
          body = _prompt("");
        }
        return body;
      },
    );
  }

  Widget _prompt(String showText) {
    return Center(
      child: Text(
        showText,
        style: TextStyle(color: const Color(0xFF979797), fontSize: 14.sp),
      ),
    );
  }
}
