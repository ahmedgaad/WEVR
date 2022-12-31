import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../data/data_sources/local_data_source/cache_helper.dart';
import '../../presentation/screens/get_started/get_started_view.dart';
import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';
import '../utils/fonts_manager.dart';
import '../utils/routes_manager.dart';
import '../utils/strings_manager.dart';
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
  required double p1,
  required double p2,
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
            padding:  EdgeInsets.all(
              p1,
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
            height: AppSize.s30.h,
          ),
          Padding(
            padding:  EdgeInsets.all(p2),
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

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

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

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    navigatePush(context, const GetStartedView());
  });
}