/*
 * @Author: wurangkun
 * @Date: 2024-10-16 17:14:24
 * @LastEditTime: 2025-01-16 16:47:49
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\main.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_util/sp_util.dart';
import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 设置状态栏样式
  SystemUiOverlayStyle style = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  await SpUtil.getInstance();
  SystemChrome.setSystemUIOverlayStyle(style);
  configLoading();

  // const AssetPickerConfig();

  // LocaleSettings.useDeviceLocale();
  runApp(const MyApp());
}
