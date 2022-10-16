import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';

ThemeData getThemeData() {
  return ThemeData(
      //main colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.transparent)),
  );
}
