/*
 * @Author: wurangkun
 * @Date: 2024-10-21 18:02:41
 * @LastEditTime: 2024-12-17 16:20:30
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\widgets\cell.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCell extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  const AppCell({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // radius: 8,
      borderRadius: BorderRadius.circular(8.r),
      onTap: () {
        onTap?.call();
      },
      child: Ink(
        width: double.infinity,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.r,
              blurRadius: 10.r,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
