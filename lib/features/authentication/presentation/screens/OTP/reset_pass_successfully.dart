import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/success_screen.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';

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
          padding: EdgeInsets.symmetric(
            vertical: AppSize.s40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SuccessScreen(
                title: AppStrings.resetSuccessfullyTitle.tr(),
                subTitle: AppStrings.resetSuccessfullySubTitle.tr(),
              ),
              defaultButton(
                width: AppSize.s281_25.w,
                function: () {
                  navigateTo(context, Routes.homeRoute);
                },
                text: AppStrings.continueExploring.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
