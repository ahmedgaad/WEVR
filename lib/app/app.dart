// ignore_for_file: prefer_const_constructors_in_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/routes_manager.dart';
import 'package:wevr_app/core/utils/themes_manager.dart';

class Wevr extends StatefulWidget {
  const Wevr({super.key});

  //final Widget? startWidget;

  //const MyApp({super.key, this.startWidget});

  @override
  State<Wevr> createState() => _WevrState();
}

class _WevrState extends State<Wevr> {
  //MyApp._internal(this.startWidget); //named constructor
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
          //home: startWidget,
          theme: getThemeData(),
        );
      },
    );
  }
}
