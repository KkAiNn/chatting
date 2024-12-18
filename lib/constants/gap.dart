/*
 * @Author: wurangkun
 * @Date: 2024-10-16 19:20:31
 * @LastEditTime: 2024-10-22 11:05:34
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\constants\gap.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

import 'dimens.dart';

/// 间隔
/// 官方做法：https://github.com/flutter/flutter/pull/54394
class Gaps {
  /// 水平间隔
  static  Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static  Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static  Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static  Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static  Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static  Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static  Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static  Widget hGap32 = SizedBox(width: Dimens.gap_dp32);

  /// 垂直间隔
  static  Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static  Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static  Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static  Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static  Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static  Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static  Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static  Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static  Widget vGap32 = SizedBox(height: Dimens.gap_dp32);
  static  Widget vGap50 = SizedBox(height: Dimens.gap_dp50);

//  static Widget line = const SizedBox(
//    height: 0.6,
//    width: double.infinity,
//    child: const DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
//  );

  static const Widget line = Divider();

  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox.shrink();

  /// 补充一种空Widget实现 https://github.com/letsar/nil
  /// https://github.com/flutter/flutter/issues/78159
}
