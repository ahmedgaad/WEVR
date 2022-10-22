// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:wevr_app/shared/managers/routes_manager.dart';
import 'package:wevr_app/shared/managers/theme_manager.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getThemeData(),
    );
  }
}
