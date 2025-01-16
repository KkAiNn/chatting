/*
 * @Author: wurangkun
 * @Date: 2024-10-21 09:45:25
 * @LastEditTime: 2024-10-21 09:53:18
 * @LastEditors: wurangkun
 * @FilePath: \flutter_chat\lib\utils\colors.dart
 * @Description: 
 */
import 'dart:ui';

Color hexToColor(String hexString) {
  return Color(int.parse(hexString, radix: 16)).withAlpha(255);
}
