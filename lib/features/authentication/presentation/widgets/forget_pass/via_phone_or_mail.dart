import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class ViaPhoneOrMail extends StatelessWidget {
  const ViaPhoneOrMail({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
            width: AppSize.s250.w,
            height: AppSize.s144.h,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          height: AppSize.s50.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: PaddingSize.p25.w,
            top: PaddingSize.p25.h,
          ),
          child: SizedBox(
            width: AppSize.s128.w,
            child: Text(
              StringsManager.recoveryCode.tr(),
              style: getBoldStylePoppins(
                  color: ColorManager.black, fontSize: FontSize.s18.sp),
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s25.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: PaddingSize.p25.w,
          ),
          child: SizedBox(
            width: AppSize.s200.w,
            child: Text(
              StringsManager.subTitleRecoveryCode.tr(),
              style: getRegularStyleInter(
                color: ColorManager.darkGrey,
                fontSize: FontSize.s16.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s70.h,
        ),
      ],
    );
  }
}
