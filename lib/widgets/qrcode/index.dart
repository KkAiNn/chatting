import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cli/utils/fileMannager/image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrCode extends StatefulWidget {
  final String data;
  final double size;
  final Function(String path, File file)? onTap;
  const MyQrCode(
      {super.key, required this.data, required this.size, this.onTap});

  @override
  State<MyQrCode> createState() => _MyQrCodeState();
}

class _MyQrCodeState extends State<MyQrCode> {
  final GlobalKey _globalKey = GlobalKey();
  File? imgFile;
  String? path;
  Future<void> capturePng() async {
    Uint8List? res = await ImageUtils.capturePng(_globalKey);
    if (res != null) {
      path = await ImageUtils.saveImageToTemp(res);
      imgFile = File(path!);
    }
  }

  Future<void> previewImage() async {
    if (path == null) {
      await capturePng();
    }
    if (path != null && imgFile != null) {
      if (widget.onTap != null) {
        widget.onTap!(path!, imgFile!);
      }
      ImageUtils.previewLocalImage(urls: [imgFile!]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: _globalKey,
        child: GestureDetector(
          onTap: previewImage,
          child: Hero(
            tag: '${widget.data}_Myqrcode',
            child: QrImageView(
              data: widget.data,
              version: QrVersions.auto,
              backgroundColor: Colors.white,
              size: widget.size,
            ),
          ),
        ));
  }
}