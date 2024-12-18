/*
 * @Author: wurangkun
 * @Date: 2024-10-23 14:40:47
 * @LastEditTime: 2024-12-17 10:21:02
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\widgets\popup.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// showModalBottomSheet：Material风格的底部弹窗
showModalBottomSheetFunction(
  context, {
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
          padding: padding,
          child: Container(
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, bottom: 24.h, top: 24.h),
            color: Colors.white,
            height: 240.h,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 55,
                  child: Text(
                    "提示",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    "这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text("再考虑下"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: const Text("考虑好了"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    },
  );
}
