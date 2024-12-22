import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cli/routes/index.dart';
import 'package:flutter_cli/widgets/ImageViewer.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImageUtils {
  /// 创建图片
  static Future<Uint8List?> capturePng(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }

  static captureAndSaveImage(
    GlobalKey key, {
    String? name,
    int quality = 80,
    Function(String path)? onSuccess,
  }) async {
    Uint8List? byteData = await capturePng(key);
    if (byteData != null) {
      saveImage(byteData, name: name, quality: quality, onSuccess: onSuccess);
    }
  }

  /// 保存图片
  static saveImage(
    Uint8List byteData, {
    String? name,
    int quality = 80,
    Function(String path)? onSuccess,
  }) async {
    final result = await ImageGallerySaverPlus.saveImage(byteData,
        quality: quality, name: name, isReturnImagePathOfIOS: true);
    print(result);
    if (onSuccess != null) {
      onSuccess(result['filePath']);
    }
  }

  /// 保存到本地目录
  static Future<void> saveImageToLocal(Uint8List imageBytes,
      {String? name}) async {
    final directory = await getExternalStorageDirectory();
    final imagePath =
        '${directory!.path}/${name ?? DateTime.now().millisecondsSinceEpoch}.png';
    File imgFile = File(imagePath);
    await imgFile.writeAsBytes(imageBytes);
    print('图片已保存至: $imagePath');
  }

  /// 保存到临时目录
  static Future<String> saveImageToTemp(Uint8List imageBytes,
      {String? name}) async {
    final directory = await getTemporaryDirectory();
    final imagePath =
        '${directory.path}/${name ?? DateTime.now().millisecondsSinceEpoch}.png';
    File imgFile = File(imagePath);
    await imgFile.writeAsBytes(imageBytes);
    print('图片已保存至: $imagePath');
    return imagePath;
  }

  static saveNetworkImage(String url,
      {String? name,
      int quality = 80,
      Function(String path)? onSuccess}) async {
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    saveImage(Uint8List.fromList(response.data),
        onSuccess: onSuccess, quality: quality, name: name);
  }

  static Future<List<String>> getAssetEntityNames(
      List<AssetEntity> immaginiMostrate) async {
    List<String> fileNames = [];
    for (int i = 0; i < immaginiMostrate.length; i++) {
      // final imageName = await immaginiMostrate[i].titleAsync;
      File? file = await immaginiMostrate[i].file;
      fileNames.add(file!.path);
    }
    return fileNames;
  }

  static Future<List<File>> getAssetEntityFile(
      List<AssetEntity> immaginiMostrate) async {
    List<File> fileNames = [];
    for (int i = 0; i < immaginiMostrate.length; i++) {
      // final imageName = await immaginiMostrate[i].titleAsync;
      File? file = await immaginiMostrate[i].file;
      fileNames.add(file!);
    }
    return fileNames;
  }

  static Future<ImageAsset?> chooseImage(
      {int maxAssets = 9, List<AssetEntity>? selectedAssets}) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(Get.context!,
        pickerConfig: AssetPickerConfig(
          maxAssets: maxAssets,
          selectedAssets: selectedAssets,
          requestType: RequestType.image,
        ));
    if (result != null) {
      List<File> path = await getAssetEntityFile(result);
      return ImageAsset(path: path, asset: result);
    }
    return null;
  }

  /// 预览本地选择图片
  static void previewLocalImage({
    required List<File> urls,
    int index = 0,
  }) {
    Get.toNamed(RouteName.ImageViewer, arguments: {
      "fileUrls": urls,
      "fileUrl": urls[index],
      "initialPage": index,
      "type": ImageViewerType.local,
    });
  }

  /// 预览网络图片
  static void previewNetImage({
    required List<String> urls,
    int index = 0,
  }) {
    Get.toNamed(RouteName.ImageViewer, arguments: {
      "imageUrls": urls,
      "imageUrl": urls[index],
      "initialPage": index,
      "type": ImageViewerType.network,
    });
  }
}

class ImageAsset {
  List<File> path;
  List<AssetEntity> asset;
  ImageAsset({required this.path, required this.asset});
}
