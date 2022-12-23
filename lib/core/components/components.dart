import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';
import '../utils/styles_manager.dart';
import '../utils/values_manager.dart';

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
  GlobalKey<FormState>? formFieldKey,
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

Widget filterWidget(){
  return Padding(
    padding: EdgeInsetsDirectional.only(
      end: AppSize.s10.w,
    ),
    child: Container(
      width: AppSize.s40.w,
      height: AppSize.s40.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius:
        BorderRadius.all(Radius.circular(AppRadius.r10)),
      ),
      child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(ImagesAssetsManager.filters)),
    ),
  );
}