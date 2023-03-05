// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/features/authentication/presentation/widgets/login/social_icon.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/fonts_manager.dart';
// import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class SocialColumn extends StatelessWidget {
  const SocialColumn({super.key});

  // final String firstText;
  // final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(
        //   firstText,
        //   style: getSemiBoldStylePoppins(
        //     color: ColorManager.primary,
        //     fontSize: AppSize.s16,
        //   ),
        // ),
        35.ph,
        const SocialButtons(),
        SizedBox(
          height: AppSize.s30.h,
        ),
        emailStack(),
        // SizedBox(
        //   height: AppSize.s30.h,
        // ),
        // Text(
        //   secondText,
        //   style: getRegularStyleInter(
        //     color: ColorManager.darkGrey,
        //     fontSize: FontSize.s14.sp,
        //   ),
        // ),
        // SizedBox(
        //   height: AppSize.s24.h,
        // ),
      ],
    );
  }
}
