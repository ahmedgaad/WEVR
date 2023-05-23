import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/color_manager.dart';
import '../../utils/fonts_manager.dart';
import '../../utils/styles_manager.dart';
import '../../utils/values_manager.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    canvasColor: ColorManager.exploreBackground,
    primarySwatch: Colors.grey,
    appBarTheme: appBarThemeWidget(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textThemeWidget(),
  );
}

TextTheme textThemeWidget() {
  return TextTheme(
    headlineMedium: getRegularStylePoppins(
        color: ColorManager.black, fontSize: FontSize.s24.sp),
    bodyLarge: getRegularStyleInter(
        color: ColorManager.darkGrey, fontSize: FontSize.s20.sp),
  );
}

AppBarTheme appBarThemeWidget() {
  return const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    // color: ColorManager.exploreBackground,
    elevation: AppSize.s0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      // statusBarColor: ColorManager.primary
    ),
  );
}
