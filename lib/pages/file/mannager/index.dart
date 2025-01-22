/*
 * @Author: wurangkun
 * @Date: 2024-10-21 15:05:09
 * @LastEditTime: 2025-01-21 18:04:10
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\pages\file\mannager\index.dart
 * @Description: 
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat/base/view/common_view.dart';
import 'package:flutter_chat/layout/page/index.dart';
import 'package:flutter_chat/pages/file/mannager/logic.dart';
import 'package:flutter_chat/utils/fileMannager/image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class FileMannagerPage extends BaseCommonView<FileMannagerLogic> {
  FileMannagerPage({super.key});

  final logic = Get.find<FileMannagerLogic>();

  @override
  String? get navTitle => '文件管理';

  @override
  Widget buildContent() {
    Widget buildImage() {
      return GridView.builder(
        shrinkWrap: true, // GridView高度自适应
        physics: const NeverScrollableScrollPhysics(), // 禁用GridView的滚动
        itemCount: logic.fileState.path.length, // 子元素的数量
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 横轴元素个数
          mainAxisSpacing: 5.h, // 纵轴间距
          crossAxisSpacing: 5.w, // 横轴间距
          // childAspectRatio: 1.0 // 子组件宽高长度比例
        ),
        itemBuilder: (BuildContext context, int index) {
          File item = logic.fileState.path[index];
          AssetEntity asset = logic.fileState.asset[index];

          return GestureDetector(
            onTap: () {
              print(asset.relativePath);
              ImageUtils.previewLocalImage(
                urls: logic.fileState.path,
                index: index,
              );
            },
            child: SizedBox(
              height: 200.h,
              width: 200.w,
              child: Hero(
                tag: item,
                child: Image(
                  image: AssetEntityImageProvider(asset, isOriginal: false),
                  // logic.fileState.path!,
                  width: 200.w,
                  height: 200.h,
                ),
              ),
            ),
          );
        }, // 子元素的布局
      );
      // return SizedBox(
      //   height: ((logic.fileState.path.length / 3).ceil() * 200).h,
      //   child: GridView.count(
      //     crossAxisCount: 3,

      //     padding: const EdgeInsets.symmetric(vertical: 0),
      //     children: logic.fileState.path
      //         .map((item) => SizedBox(
      //               height: 200.h,
      //               width: 200.w,
      //               child: Image(
      //                 image: AssetEntityImageProvider(item, isOriginal: false),
      //                 // logic.fileState.path!,
      //                 width: 200.w,
      //                 height: 200.h,
      //               ),
      //             ))
      //         .toList(),
      //   ),
      // );
    }

    return GetBuilder<FileMannagerLogic>(
      builder:
          (_) => creatCommonView(
            logic,
            (con) => Column(
              children: [
                SizedBox(
                  width: 1.sw,
                  child: GestureDetector(
                    onTap: () {
                      logic.chooseImage();
                    },
                    child: Card(
                      color: Colors.amber.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: const Text('选择文件'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  child: GestureDetector(
                    onTap: () {
                      logic.getDirectory();
                    },
                    child: Card(
                      color: Colors.amber.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: const Text('获取文件夹Documents'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  child: GestureDetector(
                    onTap: () {
                      logic.createDirectory();
                    },
                    child: Card(
                      color: Colors.amber.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: const Text('在文件夹Documents创建目录'),
                      ),
                    ),
                  ),
                ),
                Text('选择文件:${logic.fileState.path}'),
                logic.fileState.path.isNotEmpty
                    ? buildImage()
                    : const SizedBox(),
              ],
            ),
          ),
    );
  }
}
