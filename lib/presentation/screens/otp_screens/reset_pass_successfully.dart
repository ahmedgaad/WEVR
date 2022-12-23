import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/components.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/fonts_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../../../core/utils/values_manager.dart';

class ResetSuccessfully extends StatelessWidget {
  const ResetSuccessfully({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
           vertical: AppSize.s40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  ImagesAssetsManager.success,
                  width: AppSize.s192.w,
                  height: AppSize.s192.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: AppSize.s44.h,
              ),
              Text(
                  AppStrings.resetSuccessfullyTitle,
                style: getBoldStylePoppins(
                    color: ColorManager.black,
                  fontSize: FontSize.s24.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s44.h,
              ),
              Text(
                AppStrings.resetSuccessfullySubTitle,
                style: getRegularStyleInter(
                  color: ColorManager.darkGrey,
                  fontSize: FontSize.s20.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s100.h,
              ),
              defaultButton(
                width: AppSize.s281_25.w,
                  function: (){
                  navigateTo(context, Routes.homeRoute);
                  },
                  text: AppStrings.continueExploring,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
