/*
 * @Author: wurangkun
 * @Date: 2024-10-16 17:22:20
 * @LastEditTime: 2025-01-16 15:52:19
 * @LastEditors: wurangkun
 * @FilePath: \flutter-chat\lib\app.dart
 * @Description: 
 */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/custom_animation.dart';
import 'package:flutter_chat/pages/tabbar/views/user/logic.dart';
import 'package:flutter_chat/splash/binding.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'base/theme/controller.dart';
import 'routes/index.dart';

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final _appKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          key: _appKey,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.INITAL,
          getPages: AppRouter.pages,
          locale: const Locale('zh', 'CN'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate, //iOS
          ],
          supportedLocales: const [Locale('zh', 'CN'), Locale('en', 'US')],
          builder: (context, widget) {
            return MediaQuery(
              //设置文字大小不随系统设置改变
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: FlutterEasyLoading(child: widget),
            );
          },
          home: child,
          initialBinding: SplashBinding(),
          navigatorKey: navigatorKey,
          theme: FlexThemeData.light(
            scheme: FlexScheme.flutterDash,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 9,
            appBarStyle: FlexAppBarStyle.scaffoldBackground,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 10,
              blendOnColors: false,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // To use the playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.flutterDash,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 15,
            subThemesData: const FlexSubThemesData(blendOnLevel: 20),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            // To use the Playground font, add GoogleFonts package and uncomment
            // fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..contentPadding = const EdgeInsets.all(8)
    ..fontSize = 12
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue[50]
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}
