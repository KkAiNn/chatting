import 'package:logger/logger.dart';
import 'dart:developer';

const String _tag = "!@!@!@--->>>";

Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

class Log {
  static void value(dynamic msg, {String tag = _tag}) {
    _logger.v("$msg");
  }

  static void debug(dynamic msg, {String tag = _tag}) {
    _logger.d("$msg");
  }

  static void info(dynamic msg, {String tag = _tag}) {
    _logger.i("$msg");
  }

  static void error(dynamic msg, {String tag = _tag}) {
    _logger.e("$msg");
  }

  static void w(dynamic msg, {String tag = _tag}) {
    _logger.w("$msg");
  }

  static void wtf(dynamic msg, {String tag = _tag}) {
    _logger.wtf("$msg");
  }

  static void log(dynamic msg, {String tag = _tag}) {
    log(msg);
  }
}

// logV(dynamic msg, {String tag = _tag}) {
//   _logger.v("$msg");
// }

// logD(dynamic msg, {String tag = _tag}) {
//   _logger.d("$msg");
// }

// logI(dynamic msg, {String tag = _tag}) {
//   _logger.i("$msg");
// }

// logW(dynamic msg, {String tag = _tag}) {
//   _logger.w("$msg");
// }

// logE(dynamic msg, {String tag = _tag}) {
//   _logger.e("$msg");
// }

// logWTF(dynamic msg, {String tag = _tag}) {
//   log(msg);
// }
