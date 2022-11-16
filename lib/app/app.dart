// ignore_for_file: prefer_const_constructors_in_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/routes_manager.dart';
import 'package:wevr_app/shared/managers/theme_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //named constructor

  static final MyApp _instance = MyApp._internal(); //singleton or single instance
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/logo/get_started.jpg"), context);
    return ScreenUtilInit(
      designSize: const Size(360, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashRoute,
          theme: getThemeData(),
        );
      },
    );
  }
}
