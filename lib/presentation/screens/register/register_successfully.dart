import 'package:flutter/material.dart';
import '../../../core/components/components.dart';
import '../../../core/managers/assets_manager.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/managers/font_manager.dart';
import '../../../core/managers/routes_manager.dart';
import '../../../core/managers/strings_manager.dart';
import '../../../core/managers/style_manager.dart';
import '../../../core/managers/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterSuccessfully extends StatelessWidget {
  const RegisterSuccessfully({Key? key}) : super(key: key);
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
                  AppStrings.registerSuccessfully,
                style: getBoldStylePoppins(
                    color: ColorManager.black,
                  fontSize: FontSize.s24.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s44.h,
              ),
              Text(
                AppStrings.registerSuccess,
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
