/*
 * @Author: wurangkun
 * @Date: 2024-10-21 15:05:09
 * @LastEditTime: 2025-01-10 16:33:57
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\pages\file\index.dart
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_cli/base/view/common_view.dart';
import 'package:flutter_cli/constants/colors.dart';
import 'package:flutter_cli/layout/page/index.dart';
import 'package:flutter_cli/pages/file/logic.dart';
import 'package:flutter_cli/routes/index.dart';
import 'package:flutter_cli/utils/fileMannager/image.dart';
import 'package:flutter_cli/utils/loading.dart';
import 'package:flutter_cli/utils/permission/index.dart';
import 'package:flutter_cli/widgets/qrcode/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePage extends BaseCommonView<FileLogic> {
  FilePage({super.key});
  final logic = Get.find<FileLogic>();

  @override
  String? get navTitle => '文件管理';

  @override
  Widget buildContent() {
    List<ExpansionItem> expansionlist = [
      ExpansionItem(title: '本地图片保存', children: LocalImageSave()),
      ExpansionItem(title: '网络图片保存', children: NetImageSave()),
    ];
    return creatCommonView(
      logic,
      (con) => MyPage(
        children: [
          Card(
            color: Colors.amber.shade200,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.FileManager);
              },
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: const Text('系统文件管理'),
              ),
            ),
          ),
          SizedBox(
            height: 680.h,
            child: ListView.builder(
              itemCount: expansionlist.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amber.shade200,
                  child: ExpansionTile(
                    title: Text(
                      expansionlist[index].title,
                      style: TextStyle(fontSize: 16.sp, color: Colours.text),
                    ),
                    childrenPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    children: expansionlist[index].children,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExpansionItem {
  final String title;
  final List<Widget> children;

  ExpansionItem({required this.title, required this.children});
}

List<Widget> LocalImageSave() {
  GlobalKey repaintKey = GlobalKey();

  Future saveImage() async {
    if (await PermissionUtils.checkPermission(Permission.storage)) {
      ImageUtils.captureAndSaveImage(
        repaintKey,
        onSuccess: (path) => showToast('保存成功'),
      );
    }
  }

  return [
    Padding(
      padding: EdgeInsets.all(8.sp),
      child: MyQrCode(
        data: 'wurangkun',
        size: 200.sp,
        globalKey: repaintKey,
        onTap: () async {
          var res = await ImageUtils.capturePng(repaintKey);
          if (res != null) {
            ImageUtils.previewLocalImage(urls: [res.file]);
          }
        },
      ),
    ),
    ElevatedButton(onPressed: saveImage, child: const Text('下载二维码')),
  ];
}

List<Widget> NetImageSave() {
  String src =
      "https://th.bing.com/th?id=OIP.NiXkXBFxEU527hsjMAcAiAHaKe&w=213&h=300&c=10&rs=1&qlt=99&bgcl=fffffe&r=0&o=6&dpr=1.3&pid=23.1";

  Future saveImage() async {
    if (await PermissionUtils.checkPermission(Permission.storage)) {
      ImageUtils.saveNetworkImage(src, onSuccess: (path) => showToast('保存成功'));
    }
  }

  return [
    Padding(
      padding: EdgeInsets.all(8.sp),
      child: RepaintBoundary(
        child: SizedBox(
          width: 200,
          height: 200,
          child: GestureDetector(
            onTap: () {
              ImageUtils.previewNetImage(urls: [src, src, src]);
            },
            child: Hero(
              tag: src,
              child: Image.network(
                src,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : const LinearProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    ),
    ElevatedButton(onPressed: saveImage, child: const Text('保存图片')),
  ];
}
