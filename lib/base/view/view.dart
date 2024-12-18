/*
 * @Author: wurangkun
 * @Date: 2024-12-17 09:55:49
 * @LastEditTime: 2024-12-18 14:06:58
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\base\view\view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_cli/layout/page/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
abstract class BaseView<T> extends GetView<T> {
  BaseView({super.key});

  /// 状态栏高度
  double statusBarH = ScreenUtil().statusBarHeight;

  /// 导航栏高度
  // double navBarH = AppBar().preferredSize.height;
  double navBarH = 44.h;

  /// 底部安全区域高度
  double safeBarH = ScreenUtil().bottomBarHeight;

  /// 设置背景颜色
  Color? contentColor = Colors.white;

  /// 是否自定义透明appbar
  bool? isCustomAppBar = false;

  /// 设置标题文字
  String? navTitle;

  /// 设置标题文字颜色
  Color? navTitleColor = const Color(0xff282a84);

  /// 设置导航栏颜色
  Color? navColor = Colors.white;

  /// 设置左边按钮
  Widget? leftButton;

  /// 设置左边宽度
  double? leftWidth;

  /// 设置右边按钮数组
  List<Widget>? rightActionList = [];

  /// 是否隐藏导航栏
  bool? isHiddenNav;

  /// 设置主主视图内容(子类不实现会报错)
  Widget buildContent();

  // Widget buildScroll()

  @override
  Widget build(BuildContext context) {
    /// 当前路由的索引
    var navIndex = Get.routing.route?.navigator?.focusNode.children.length ?? 0;

    PreferredSizeWidget buildAppBar() {
      return AppBar(
        toolbarHeight: navBarH,
        // backgroundColor: Theme.of(context).colorScheme,
        centerTitle: true,
        title: Text(
          navTitle ?? '',
          style: TextStyle(fontSize: 18.sp),
        ),
        leading: leftButton ?? buildDefaultLeading(navIndex),
        leadingWidth: leftWidth ?? 66.w,
        actions: rightActionList,
      );
    }

    /// 自定义导航栏 不占位appbar
    Widget buildCustomAppBar(
        {Color? appBarbackgroundColor, String? appbarTitle}) {
      return SafeArea(
        top: true,
        child: SizedBox(
          height: navBarH,
          width: 1.sw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftButton ?? buildDefaultLeading(navIndex),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: rightActionList ?? [],
                  ))
            ],
          ),
        ),
      );
    }

    /// 常规页面
    Widget buildPage() {
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          appBar: isHiddenNav == true ? null : buildAppBar(),
          body: MyPage(children: [buildContent()]));
    }

    /// appbar不占位页面
    Widget buildFixedAppBarPage() {
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  MyPage(children: [buildContent()]),
                  Positioned(
                      top: 0, left: 0, right: 0, child: buildCustomAppBar()),
                ],
              )));
    }

    return isCustomAppBar == true ? buildFixedAppBarPage() : buildPage();
  }
}

/// 默认返回按钮
Widget buildDefaultLeading(int index) {
  Widget back = SizedBox(
    width: 24.w,
    height: 24.h,
    child: GestureDetector(
        onTap: () {
          print('object');
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 24.w,
        )),
  );
  Widget home = SizedBox(
    width: 24.w,
    height: 24.h,
    child: GestureDetector(
        onTap: () {
          Get.until((route) => route.isFirst);
        },
        child: Icon(
          Icons.home,
          size: 24.w,
        )),
  );
  if (index > 1) {
    if (index > 2) {
      return Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [back, SizedBox(width: 8.w), home],
          ));
    }
    return Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [back],
        ));
  }
  return const SizedBox();
}
