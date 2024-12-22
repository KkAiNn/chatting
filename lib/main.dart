/*
 * @Author: wurangkun
 * @Date: 2024-10-16 17:14:24
 * @LastEditTime: 2024-12-17 18:34:38
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\main.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 设置状态栏样式
  SystemUiOverlayStyle style = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(style);
  configLoading();

  // const AssetPickerConfig();

  // LocaleSettings.useDeviceLocale();
  runApp(const MyApp());
}
