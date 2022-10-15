import 'package:flutter/material.dart';
import 'package:wevr_app/presentation/resources/font_manager.dart';

TextStyle _getTextStyleInter(double fontSize, FontWeight fontWeight, Color color){
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamilyInter,
    color: color,
  );
}//Inter Style

//bold style inter
TextStyle getBoldStyleInter({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyleInter(
      fontSize,
      FontWeightManager.bold,
      color);
}

//semiBold style inter
TextStyle getSemiBoldStyleInter({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyleInter(
      fontSize,
      FontWeightManager.semiBold,
      color);
}

//medium style inter
TextStyle getMediumStyleInter({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyleInter(
      fontSize,
      FontWeightManager.medium,
      color);
}

//regular style inter
TextStyle getRegularStyleInter({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyleInter(
      fontSize,
      FontWeightManager.regular,
      color);
}

//light style inter
TextStyle getLightStyleInter({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStyleInter(
      fontSize,
      FontWeightManager.bold,
      color);
}



//---------------------------------------------------------//
TextStyle _getTextStylePoppins(double fontSize, FontWeight fontWeight, Color color){
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamilyPoppins,
    color: color,
  );
}//Poppins Style

//bold style Poppins
TextStyle getBoldStylePoppins({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStylePoppins(
      fontSize,
      FontWeightManager.bold,
      color);
}

//semiBold style Poppins
TextStyle getSemiBoldStylePoppins({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStylePoppins(
      fontSize,
      FontWeightManager.semiBold,
      color);
}

//medium style Poppins
TextStyle getMediumStylePoppins({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStylePoppins(
      fontSize,
      FontWeightManager.medium,
      color);
}

//regular style Poppins
TextStyle getRegularStylePoppins({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStylePoppins(
      fontSize,
      FontWeightManager.regular,
      color);
}

//light style Poppins
TextStyle getLightStylePoppins({double fontSize = FontSize.s12, required Color color, }){
  return _getTextStylePoppins(
      fontSize,
      FontWeightManager.bold,
      color);
}