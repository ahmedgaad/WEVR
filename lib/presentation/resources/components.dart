import 'package:flutter/material.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';
import 'package:wevr_app/presentation/resources/font_manager.dart';
import 'package:wevr_app/presentation/resources/style_manager.dart';
import 'package:wevr_app/presentation/resources/values_manager.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = ColorManager.primary,
  bool isUpperCase = true,
  double radius = 15.0,
  double borderRadius = 3,
  required VoidCallback function,
  required String text,
  Color textColor = ColorManager.white,
  Color borderColor = ColorManager.transparent,}) => Container(
  width: width,
  height: 50.0,
  decoration: BoxDecoration(
    border: Border.all(
      color: borderColor,
      width: borderRadius,
    ),
    borderRadius: BorderRadius.circular(
      radius,

    ),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: getBoldStylePoppins(color: textColor),
    ),
  ),

);

