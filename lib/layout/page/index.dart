/*
 * @Author: wurangkun
 * @Date: 2024-10-16 17:26:13
 * @LastEditTime: 2024-12-17 18:30:59
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\layout\page\index.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatelessWidget {
  final List<Widget> children;
  final Function(double offset)? onScroll;
  final Axis direction = Axis.vertical;

  const MyPage({super.key, required this.children, this.onScroll});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    controller.addListener(() {
      if (onScroll != null) {
        onScroll!(controller.offset);
      }
    });
    return SizedBox(
      width: 1.sw,
      child: SingleChildScrollView(
        controller: controller,
        child: Flex(direction: direction, children: children),
      ),
    );
  }
}
