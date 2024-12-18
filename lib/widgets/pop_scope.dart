/*
 * @Author: wurangkun
 * @Date: 2024-10-21 13:40:48
 * @LastEditTime: 2024-10-21 14:43:32
 * @LastEditors: wurangkun
 * @FilePath: \flutter_cli\lib\widgets\pop_scope.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cli/utils/loading.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppPopScope extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const AppPopScope(
      {super.key,
      required this.child,
      this.duration = const Duration(seconds: 2)});

  @override
  State<AppPopScope> createState() => _AppPopScopeState();
}

class _AppPopScopeState extends State<AppPopScope> {
  // final double count = 0;
  DateTime? _lastTime;

  Future<bool> _isExit() async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!) > widget.duration) {
      _lastTime = DateTime.now();
      showToast('再次点击退出应用', toastPosition: EasyLoadingToastPosition.bottom);
      return Future.value(false);
    }

    await SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          _isExit();
        },
        child: widget.child);
  }
}
