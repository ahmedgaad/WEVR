import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../managers/assets_manager.dart';
import '../managers/color_manager.dart';
import '../managers/font_manager.dart';
import '../managers/routes_manager.dart';
import '../managers/strings_manager.dart';
import '../managers/style_manager.dart';
import '../managers/values_manager.dart';

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

Widget backButton({
  required VoidCallback function,
}){
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

Widget emailStack(){
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
          borderRadius: BorderRadius.circular(
              AppRadius.r20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              PaddingSize.p0),
          child: Center(
            child: Text(
              AppStrings.or,
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

Widget background(context, {
  required String buttonText,
  required String questionText,
  required String route,
}){
  return Column(children: [
    Expanded(
      flex: AppSize.s2.toInt(),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppRadius.r93),
            bottomRight: Radius.circular(AppRadius.r93),
          ),
        ),
      ),
    ),
    Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              PaddingSize.p70,
            ),
            child: Text(
              questionText,
              style: getRegularStyleInter(
                color: ColorManager.darkGrey,
                fontSize: AppSize.s16.sp,
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s24.h,
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingSize.p30),
            child: defaultTextButton(
                textColor: ColorManager.primary,
                text: buttonText,
                onPressed: () {
                  navigateTo(context, route);
                }),
          ),
        ],
      ),
    ),
  ]);
}