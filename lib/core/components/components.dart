import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';
import '../utils/fonts_manager.dart';
import '../utils/strings_manager.dart';
import '../utils/styles_manager.dart';
import '../utils/values_manager.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = AppSize.s50,
  Color? background,
  bool isUpperCase = true,
  double radius = AppSize.s10,
  double borderRadius = AppSize.s2,
  required VoidCallback function,
  required String text,
  Color? textColor,
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
        color: background ?? ColorManager.primary,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: getBoldStylePoppins(
            color: textColor ?? ColorManager.white,
            fontSize: AppSize.s16,
          ),
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
  Function(String?)? onSaved,
  String? Function(String?)? validate,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  GlobalKey<FormState>? formFieldKey,
  String? label,
  final IconData? prefix,
  bool? isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool? isClickable = true,
}) =>
    TextFormField(
      onSaved: onSaved,
      keyboardType: type,
      validator: validate,
      controller: controller,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return '$validate';
      //   }
      //   return null;
      // },
      key: formFieldKey,
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
                icon: Icon(
                  suffix,
                  size: AppSize.s25,
                  color: ColorManager.black,
                ),
                onPressed: suffixPressed,
              )
            : null,
      ),
    );

void navigateTo(context, String routeName) =>
    Navigator.pushReplacementNamed(context, routeName);

void navigatePush(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget defaultTextButton({
  required String text,
  TextDecoration? textDecoration,
  Color textColor = ColorManager.darkGrey,
  required VoidCallback onPressed,
  double fontSize = AppSize.s16,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            decoration: textDecoration,
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );

Widget filterWidget() {
  return Padding(
    padding: EdgeInsetsDirectional.only(
      end: AppSize.s10.w,
    ),
    child: Container(
      width: AppSize.s40.w,
      height: AppSize.s40.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
      ),
      child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsImagesManager.filters)),
    ),
  );
}

Widget backButton({
  required VoidCallback function,
}) {
  return IconButton(
    onPressed: function,
    icon: const Padding(
      padding: EdgeInsets.all(PaddingSize.p20),
      child: Icon(
        Icons.arrow_back,
        size: AppSize.s24,
      ),
    ),
  );
}

Widget emailStack() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: AppSize.s1.h,
        width: AppSize.s200.w,
        color: ColorManager.lightGrey,
      ),
      Container(
        width: AppSize.s30.w,
        height: AppSize.s12.h,
        decoration: BoxDecoration(
          color: ColorManager.orBackground,
          borderRadius: BorderRadius.circular(AppRadius.r20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.p0),
          child: Center(
            child: Text(
              StringsManager.or,
              style: getRegularStyleInter(
                color: ColorManager.black,
                fontSize: FontSize.s10.sp,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

void showToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

//enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amberAccent;
      break;
  }
  return color;
}

Widget moneyIcon() {
  return Container(
    width: AppSize.s30,
    height: AppSize.s25,
    child: SvgPicture.asset(AssetsImagesManager.moneyIcon),
  );
}

Widget textInputInField(String text) {
  return Text(
    text,
    style: getRegularStylePoppins(
      color: ColorManager.darkGrey,
      fontSize: AppSize.s14.sp,
    ),
  );
}
