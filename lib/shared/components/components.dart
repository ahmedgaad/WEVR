import 'package:flutter/material.dart';
import '../managers/color_manager.dart';
import '../managers/style_manager.dart';
import '../managers/values_manager.dart';

import '../managers/strings_manager.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = AppSize.s50,
  Color background = ColorManager.primary,
  bool isUpperCase = true,
  double radius = AppSize.s15,
  double borderRadius = AppSize.s3,
  required VoidCallback function,
  required String text,
  Color textColor = ColorManager.white,
  Color borderColor = ColorManager.transparent,
}) =>
    Container(
      width: width,
      height: height,
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
          style: getMediumStylePoppins(color: textColor, fontSize: AppSize.s20 ),
          textAlign: TextAlign.center,
        ),
      ),
    );

Widget defaultFormField({
  final TextEditingController? controller,
  required final TextInputType type,
  Widget? labelWidget,
  Widget? suffixWidget,
  // String? validate,
  String? Function(String?)? validate,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  String? label,
  final IconData? prefix,
  bool? isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool? isClickable = true,
}) =>
    TextFormField(
      keyboardType: type,
      validator: validate,
      controller: controller,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return '$validate';
      //   }
      //   return null;
      // },
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        suffix: suffixWidget,
        labelText: label,
        label: labelWidget,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix , size: AppSize.s25, color: ColorManager.black,),
                onPressed: suffixPressed,
              )
            : null,
      ),
    );

void navigateTo(context, String routeName) =>
    Navigator.pushReplacementNamed(context, routeName);

void navigatePush(context, Widget widget) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget));

Widget defaultTextButton({
  required String text,
  TextDecoration? textDecoration,
  Color textColor = ColorManager.darkGrey,
  required VoidCallback onPressed,
  double fontSize = AppSize.s16,
})=> TextButton(
  onPressed: onPressed ,
  child: Text(
    text,
    style: TextStyle(
      decoration: textDecoration,
      color: textColor,
      fontSize: fontSize,
    ),
  ),
);
