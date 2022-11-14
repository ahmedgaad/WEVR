import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/managers/assets_manager.dart';
import '../../shared/managers/color_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/managers/font_manager.dart';
import '../../shared/managers/routes_manager.dart';
import '../../shared/managers/strings_manager.dart';
import '../../shared/managers/style_manager.dart';
import '../../shared/managers/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
