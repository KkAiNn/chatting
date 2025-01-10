import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cli/routes/index.dart';
import 'package:flutter_cli/widgets/ImageViewer.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImageUtils {
  /// 根据key 创建图片
  static Future<CapturePngResult?> capturePng(
    GlobalKey key, {
    String? name,
  }) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      var uint8 = byteData?.buffer.asUint8List();
      if (uint8 == null) return null;
      var path = await ImageUtils.saveImageToTemp(uint8, name: name);
      var imgFile = File(path!);
      return CapturePngResult(uint8: uint8, path: path, file: imgFile);
      // {uint8: uint8, path: path, file: imgFile};
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// 根据key 创建图片 并且 保存图片
  static captureAndSaveImage(
    GlobalKey key, {
    String? name,
    int quality = 80,
    Function(String path)? onSuccess,
  }) async {
    CapturePngResult? byteData = await capturePng(key);
    print('byteData: $byteData,key: $key');
    if (byteData != null) {
      saveImage(
        byteData.uint8,
        name: name,
        quality: quality,
        onSuccess: onSuccess,
      );
    }
  }

  /// 保存图片
  static saveImage(
    Uint8List byteData, {
    String? name,
    int quality = 80,
    Function(String path)? onSuccess,
  }) async {
    final result = await ImageGallerySaverPlus.saveImage(
      byteData,
      quality: quality,
      name: name,
      isReturnImagePathOfIOS: true,
    );
    print(result);
    if (onSuccess != null) {
      onSuccess(result['filePath']);
    }
  }

  /// 保存到本地目录
  static Future<void> saveImageToLocal(
    Uint8List imageBytes, {
    String? name,
  }) async {
    final directory = await getExternalStorageDirectory();
    final imagePath =
        '${directory!.path}/${name ?? DateTime.now().millisecondsSinceEpoch}.png';
    File imgFile = File(imagePath);
    await imgFile.writeAsBytes(imageBytes);
    print('图片已保存至: $imagePath');
  }

  /// 保存到临时目录
  static Future<String> saveImageToTemp(
    Uint8List imageBytes, {
    String? name,
  }) async {
    final directory = await getTemporaryDirectory();
    final imagePath =
        '${directory.path}/${name ?? DateTime.now().millisecondsSinceEpoch}.png';
    File imgFile = File(imagePath);
    await imgFile.writeAsBytes(imageBytes);
    print('图片已保存至: $imagePath');
    return imagePath;
  }

  static saveNetworkImage(
    String url, {
    String? name,
    int quality = 80,
    Function(String path)? onSuccess,
  }) async {
    var response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    saveImage(
      Uint8List.fromList(response.data),
      onSuccess: onSuccess,
      quality: quality,
      name: name,
    );
  }

  static Future<List<String>> getAssetEntityNames(
    List<AssetEntity> immaginiMostrate,
  ) async {
    List<String> fileNames = [];
    for (int i = 0; i < immaginiMostrate.length; i++) {
      // final imageName = await immaginiMostrate[i].titleAsync;
      File? file = await immaginiMostrate[i].file;
      fileNames.add(file!.path);
    }
    return fileNames;
  }

  static Future<List<File>> getAssetEntityFile(
    List<AssetEntity> immaginiMostrate,
  ) async {
    List<File> fileNames = [];
    for (int i = 0; i < immaginiMostrate.length; i++) {
      // final imageName = await immaginiMostrate[i].titleAsync;
      File? file = await immaginiMostrate[i].file;
      fileNames.add(file!);
    }
    return fileNames;
  }

  static Future<ImageAsset?> chooseImage({
    int maxAssets = 9,
    List<AssetEntity>? selectedAssets,
  }) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      Get.context!,
      pickerConfig: AssetPickerConfig(
        maxAssets: maxAssets,
        selectedAssets: selectedAssets,
        requestType: RequestType.image,
      ),
    );
    if (result != null) {
      List<File> path = await getAssetEntityFile(result);
      return ImageAsset(path: path, asset: result);
    }
    return null;
  }

  static void previewImage<T>({
    required List<T> urls,
    int index = 0,
    bool isAsset = true,
  }) {
    if (isAsset) {
      previewLocalImage(urls: urls as List<File>, index: index);
    } else {
      previewNetImage(urls: urls as List<String>, index: index);
    }
  }

  /// 预览本地选择图片
  static void previewLocalImage({required List<File> urls, int index = 0}) {
    showCupertinoDialog(
      context: Get.context!,
      builder:
          (c) => ImageViewer(
            fileUrls: urls,
            fileUrl: urls[index],
            initialPage: index,
            tag: urls[index],
            type: ImageViewerType.local,
          ),
    );
  }

  /// 预览网络图片
  static void previewNetImage<T extends String>({
    required List<T> urls,
    int index = 0,
  }) {
    showCupertinoDialog(
      context: Get.context!,
      builder:
          (c) => ImageViewer(
            imageUrls: urls,
            imageUrl: urls[index],
            initialPage: index,
            tag: urls[index],
            type: ImageViewerType.network,
          ),
    );
  }

  /// 获取七牛云上图片缩略图
  static getQiNiuImageThumbUrl(
    String url, {
    double width = 350.0,
    double? height,
    int quality = 75,
    bool? webp = true,
  }) {
    if (url.contains('?Size=') || url.contains('?size=')) {
      List<String> strList =
          url.contains('?Size=') ? url.split('?Size=') : url.split('?size=');
      url = strList.first;

      if (height == null) {
        String sizeStr = strList.last;
        List<String> sizeList = sizeStr.split('x');
        double oldImgWid = double.parse(sizeList.first);
        double oldImgHei = double.parse(sizeList.last);
        double newImgWid = width;
        double proportion = oldImgHei / oldImgWid;
        if (proportion > 1) {
          proportion = 4 / 3;
        } else {
          proportion = 3 / 4;
        }
        double newImgHei = proportion * newImgWid;
        url +=
            '?imageView2/0/format${webp == true ? '/webp' : ''}/q/$quality/w/${newImgWid.floor()}/h/${newImgHei.floor()}';
      } else {
        // imageView2/0/format/webp/q/75

        url +=
            '?imageView2/0/format${webp == true ? '/webp' : ''}/q/$quality/w/${width.floor()}/h/${height.floor()}';
      }
    } else {
      if (height != null) {
        url +=
            '?imageView2/0/format${webp == true ? '/webp' : ''}/q/$quality/w/${width.floor()}/h/${height.floor()}';
      }
    }

    return url;
  }
}

class ImageAsset {
  List<File> path;
  List<AssetEntity> asset;
  ImageAsset({required this.path, required this.asset});
}

class CapturePngResult {
  final Uint8List uint8;
  final String path;
  final File file;
  CapturePngResult({
    required this.uint8,
    required this.path,
    required this.file,
  });
}
