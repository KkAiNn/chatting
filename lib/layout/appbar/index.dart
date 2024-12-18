import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/dimens.dart';
import '../../utils/theme_utils.dart';

/// 自定义AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      this.backgroundColor,
      this.title = '标题',
      this.centerTitle = '标题',
      this.actionName = '',
      this.backImg = 'assets/images/ic_back_black.png',
      this.backImgColor,
      this.onPressed,
      this.rightWidget,
      this.isBack = true});

  final Color? backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final Color? backImgColor;
  final String actionName;
  final VoidCallback? onPressed;
  final bool isBack;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? context.backgroundColor;

    final SystemUiOverlayStyle overlayStyle =
        ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? ThemeUtils.light
            : ThemeUtils.dark;

    final Widget back = isBack
        ? IconButton(
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              final isBack = await Navigator.maybePop(context);
              if (!isBack) {
                await SystemNavigator.pop();
              }
            },
            // tooltip: 'Back',
            icon: Image.asset(
              width: 22.w,
              height: 22.h,
              backImg,
              color: backImgColor ?? ThemeUtils.getIconColor(context),
            ),
          )
        : const SizedBox(
            width: 5,
            height: 5,
          );

    final Widget action = rightWidget ??
        const SizedBox(
          width: 5,
          height: 5,
        );

    final Widget titleWidget = Text(
      title.isEmpty ? centerTitle : title,
      style: TextStyle(
        fontSize: Dimens.font_sp18,
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: bgColor,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 60.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [back],
                    )),
                titleWidget,
                SizedBox(
                    width: 60.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [action],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 44.h);
}
