import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';
import 'package:wevr_app/shared/managers/font_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:wevr_app/shared/managers/values_manager.dart';

ThemeData getThemeData() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primarySwatch: Colors.grey,

    //appBar theme
    appBarTheme: const AppBarTheme(
        color: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
        ),
    ),

    //text theme 2021, cause i can't mix between 2018 and 2021 themes..
    textTheme: TextTheme(
      headlineMedium: getRegularStylePoppins(
          color: ColorManager.black, fontSize: FontSize.s24),
      bodyLarge: getRegularStyleInter(
          color: ColorManager.darkGrey, fontSize: FontSize.s20),
    ),
  );
}
