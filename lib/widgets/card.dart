/*
 * @Author: wurangkun
 * @Date: 2024-10-21 18:02:41
 * @LastEditTime: 2024-12-17 10:20:01
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\widgets\card.dart
 * @Description: 
 */
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  const AppCard({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: () {
        log('123123');
        if (onTap != null) {
          onTap!();
        }
      },
      child: Ink(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 8.h,
          bottom: 8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
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
