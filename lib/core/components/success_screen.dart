import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';
import '../utils/fonts_manager.dart';
import '../utils/styles_manager.dart';
import '../utils/values_manager.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.title, required this.subTitle}) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            AssetsImagesManager.success,
            width: AppSize.s192.w,
            height: AppSize.s192.h,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          height: AppSize.s50.h,
        ),
        Text(
          title,
          style: getBoldStylePoppins(
            color: ColorManager.black,
            fontSize: FontSize.s20.sp,
          ),
        ),
        SizedBox(
          height: AppSize.s44.h,
        ),
        SizedBox(
          width: AppSize.s250,
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: getRegularStyleInter(
              color: ColorManager.darkGrey,
              fontSize: FontSize.s16.sp,
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s150.h,
        ),
      ],
    );
  }
}
