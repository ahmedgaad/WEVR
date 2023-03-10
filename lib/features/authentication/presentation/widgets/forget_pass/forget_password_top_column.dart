import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class ForgetPasswordTopColumn extends StatelessWidget {
  const ForgetPasswordTopColumn({Key? key, required this.imagePath, required this.title, required this.subTitle}) : super(key: key);

  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
            width: AppSize.s304.w,
            height: AppSize.s264.h,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: PaddingSize.p25,
            top: PaddingSize.p25,
          ),
          child: SizedBox(
            width: AppSize.s83.w,
            child: Text(
              title,
              style: getBoldStylePoppins(
                  color: ColorManager.black, fontSize: FontSize.s16.sp),
            ),
          ),
        ),
        SizedBox(height: AppSize.s20.h),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: PaddingSize.p25,
          ),
          child: SizedBox(
            width: AppSize.s184.w,
            child: Text(
              subTitle,
              // AppStrings.subTitleForgotPass.tr(),
              style: getRegularStyleInter(
                color: ColorManager.darkGrey,
                fontSize: FontSize.s14.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: AppSize.s50.h),
      ],
    );
  }
}