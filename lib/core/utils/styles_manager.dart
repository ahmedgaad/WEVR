import 'package:flutter/material.dart';
import 'package:wevr_app/core/utils/color_manager.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyleInter(
    double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamilyInter,
    color: color,
  );
} //Inter Style

//bold style Inter
TextStyle getBoldStyleInter({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyleInter(fontSize, FontWeightManager.bold, color);
}

//semiBold style Inter
TextStyle getSemiBoldStyleInter({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyleInter(fontSize, FontWeightManager.semiBold, color);
}

//medium style Inter
TextStyle getMediumStyleInter({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyleInter(fontSize, FontWeightManager.medium, color);
}

//regular style Inter
TextStyle getRegularStyleInter({
  double fontSize = FontSize.s12,
   Color? color,
}) {
  return _getTextStyleInter(fontSize, FontWeightManager.regular, color?? ColorManager.black);
}

//light style Inter
TextStyle getLightStyleInter({
  double fontSize = FontSize.s10,
  required Color color,
}) {
  return _getTextStyleInter(fontSize, FontWeightManager.bold, color);
}

//---------------------------------------------------------//
TextStyle _getTextStylePoppins(
    double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamilyPoppins,
    color: color,
  );
} //Poppins Style

//bold style Poppins
TextStyle getBoldStylePoppins({double fontSize = FontSize.s20, Color? color}) {
  return _getTextStylePoppins(
      fontSize, FontWeightManager.bold, color ?? ColorManager.black);
}

//semiBold style Poppins
TextStyle getSemiBoldStylePoppins({
  double fontSize = FontSize.s22,
  Color? color,
}) {
  return _getTextStylePoppins(
      fontSize, FontWeightManager.semiBold, color ?? ColorManager.black);
}

//medium style Poppins
TextStyle getMediumStylePoppins({
  double fontSize = FontSize.s12,
  Color? color,
}) {
  return _getTextStylePoppins(
      fontSize, FontWeightManager.medium, color ?? ColorManager.black);
}

//regular style Poppins
TextStyle getRegularStylePoppins({
  double fontSize = FontSize.s24,
  Color? color,
}) {
  return _getTextStylePoppins(
      fontSize, FontWeightManager.regular, color ?? ColorManager.black);
}

//light style Poppins
TextStyle getLightStylePoppins({
  double fontSize = FontSize.s12,
  Color? color,
}) {
  return _getTextStylePoppins(
      fontSize, FontWeightManager.bold, color ?? ColorManager.black);
}
