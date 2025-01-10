import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  String url = "";
  double? width;
  double? height;

  double? marginLeft = 0;
  double? marginRight = 0;
  double? marginTop = 0;
  double? marginBottom = 0;
  double? cornerRadius = 0;
  double? margin = 0;
  double? borderWidth = 0;
  Color? borderColor = Colors.transparent;
  bool? isCircle = false;
  Color? backgroundColor = Colors.transparent;
  VoidCallback? onClick;

  ImageView(
    this.url, {
    this.width,
    this.height,
    this.marginBottom,
    this.marginRight,
    this.marginTop,
    this.marginLeft,
    this.margin,
    this.cornerRadius,
    this.isCircle,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor,
    this.onClick,
  }) {
    if (margin != null) {
      if (margin != null && margin! > 0) {
        marginLeft = margin;
        marginTop = margin;
        marginRight = margin;
        marginBottom = margin;
      }
    }

    if (isCircle != null) {
      if (isCircle ?? true) {
        cornerRadius = width ?? 0 / 2;
      }
    }

    if (onClick == Null) {
      onClick = () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(marginLeft ?? 0, marginTop ?? 0,
            marginRight ?? 0, marginBottom ?? 0),
        decoration: BoxDecoration(
          border: Border.all(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent),
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 0)),
        ),
        child: GestureDetector(
          onTap: onClick,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(cornerRadius ?? 0),
              child: getImage()),
        ));
  }

  Widget getImage() {
    if (url.startsWith("http")) {
      //网络图片
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else if (url.startsWith("images")) {
      //项目内图片
      print("加载项目图片:${url}");
      return Image.asset(url, width: width, height: height, fit: BoxFit.cover);
    } else {
      //加载手机里面的图片
      return Image.file(File(url),
          width: width, height: height, fit: BoxFit.cover);
    }
  }
}
