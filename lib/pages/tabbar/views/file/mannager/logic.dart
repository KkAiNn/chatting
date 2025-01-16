import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cli/base/controller/common_controller.dart';
import 'package:flutter_cli/base/controller/controller.dart';
import 'package:flutter_cli/constants/customs/pickers/directory_file_asset_picker.dart';
import 'package:flutter_cli/constants/customs/pickers/insta_asset_picker.dart';
import 'package:flutter_cli/constants/customs/pickers/multi_tabs_assets_picker.dart';
import 'package:flutter_cli/constants/extensions.dart';
import 'package:flutter_cli/pages/tabbar/views/file/mannager/state.dart';
import 'package:flutter_cli/utils/fileMannager/image.dart';
import 'package:flutter_cli/constants/custom_pick_method.dart';
import 'package:path_provider/path_provider.dart';

class FileMannagerLogic extends BaseCommonController {
  FileMannagerState fileState = FileMannagerState();

  @override
  void initData() {
    netState = NetState.dataSussessState;
    update();
  }

  @override
  void loadMore() {
    // TODO: implement loadMore
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void refreshData() {
    // TODO: implement refreshData
  }

  List<CustomPickMethod> pickMethods(BuildContext context) {
    return <CustomPickMethod>[
      CustomPickMethod(
        icon: '🗄',
        name: context.l10n.customPickerDirectoryAndFileName,
        description: context.l10n.customPickerDirectoryAndFileDescription,
        method: (BuildContext context) {
          Navigator.maybeOf(context)?.push<void>(
            MaterialPageRoute<void>(
              builder: (_) => const DirectoryFileAssetPicker(),
            ),
          );
        },
      ),
      CustomPickMethod(
        icon: '🔀',
        name: context.l10n.customPickerMultiTabName,
        description: context.l10n.customPickerMultiTabDescription,
        method: (BuildContext context) {
          Navigator.maybeOf(context)?.push<void>(
            MaterialPageRoute<void>(
              builder: (_) => const MultiTabAssetPicker(),
            ),
          );
        },
      ),
      CustomPickMethod(
        icon: '📷',
        name: context.l10n.customPickerInstagramLayoutName,
        description: context.l10n.customPickerInstagramLayoutDescription,
        method:
            (BuildContext context) => Navigator.maybeOf(context)?.push<void>(
              MaterialPageRoute<void>(builder: (_) => const InstaAssetPicker()),
            ),
      ),
    ];
  }

  Future<void> chooseImage() async {
    ImageAsset? result = await ImageUtils.chooseImage(
      selectedAssets: fileState.asset,
      maxAssets: 100,
    );
    if (result != null) {
      fileState.asset = result.asset;
      fileState.path = result.path;
      update();
    }
  }

  Future<void> getDirectory() async {
    Directory? result = await getApplicationDocumentsDirectory();
    print(result.path);
    print(result.parent);
    List<FileSystemEntity> list = result.listSync();
    print(list.toString());
  }

  Future<void> createDirectory() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}${Platform.pathSeparator}dirName';
    var dir = Directory(path);
    var exist = dir.existsSync();
    print(exist);
    print("Platform.pathSeparator:${Platform.pathSeparator}");
    if (exist) {
      print('当前文件夹已经存在');
    } else {
      var result = await dir.create();
      print('$result');
    }

    getDirectory();
    // print(result.path);
    // print(result.parent);
    // List<FileSystemEntity> list = result.listSync();
  }
}
