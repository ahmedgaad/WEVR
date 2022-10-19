import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';
import 'package:wevr_app/presentation/resources/font_manager.dart';
import 'package:wevr_app/presentation/resources/style_manager.dart';
import 'package:wevr_app/presentation/resources/values_manager.dart';

ThemeData getThemeData() {
  return ThemeData(
      //main colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,

    //appBar theme
    /*appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.transparent
          )
      ),
    */

    //text theme 2021, cause i can't mix between 2018 and 2021 themes..
    textTheme: TextTheme(
      headlineMedium: getRegularStylePoppins(color: ColorManager.black, fontSize: FontSize.s24),
      bodyLarge: getRegularStyleInter(color: ColorManager.darkGrey, fontSize: FontSize.s20),
    ),
  );
}
