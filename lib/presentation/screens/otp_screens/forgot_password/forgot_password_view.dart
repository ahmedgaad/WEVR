import 'package:flutter/material.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/managers/assets_manager.dart';
import '../../../../shared/managers/color_manager.dart';
import '../../../../shared/managers/font_manager.dart';
import '../../../../shared/managers/strings_manager.dart';
import '../../../../shared/managers/style_manager.dart';
import '../../../../shared/managers/values_manager.dart';
import '../reset_via_email/reset_email_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../reset_via_phone/reset_phone_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IconButton(
            //   onPressed: () {
            //     navigateTo(context, Routes.loginRoute);
            //   },
            //   icon: const Padding(
            //     padding: EdgeInsets.all(PaddingSize.p25),
            //     child: Icon(
            //       Icons.arrow_back_ios,
            //       size: AppSize.s24,
            //     ),
            //   ),
            // ),
            Align(
              child: SvgPicture.asset(
                ImagesAssetsManager.forgotPass,
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
              child: Text(
                AppStrings.forgotPass,
                style: getBoldStylePoppins(
                    color: ColorManager.black,
                  fontSize: FontSize.s24.sp
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: PaddingSize.p25,
              ),
              child: Text(
                AppStrings.subTitleForgotPass,
                style: getRegularStyleInter(
                    color: ColorManager.darkGrey,
                    fontSize: FontSize.s20.sp,
                ),
              ),
            ),
            //via phone number
            Padding(
              padding: const EdgeInsets.all(
                  PaddingSize.p10
              ),
              child: GestureDetector(
                onTap: (){
                  navigatePush(context, const ResetPhoneView());
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: AppSize.s320.w,
                    height: AppSize.s96.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.darkGrey,
                        width: AppSize.s1.w,
                      ),
                      borderRadius: BorderRadius.circular(
                          AppSize.s10,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: AppSize.s15.w,
                        ),
                        SvgPicture.asset(
                          ImagesAssetsManager.phoneIc,
                          width: AppSize.s56.w,
                          height: AppSize.s56.h,
                          fit: BoxFit.scaleDown,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                             horizontal:  AppSize.s20.w,
                            vertical: AppSize.s20.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text(
                                AppStrings.viaPhone,
                                style: getRegularStyleInter(
                                    color: ColorManager.viaPhone,
                                  fontSize: FontSize.s16.sp,
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s10.h,
                              ),
                              Text(
                                "... ...1234",
                                style: getRegularStyleInter(
                                  color: ColorManager.viaPhone,
                                  fontSize: FontSize.s16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //via email
            Padding(
              padding: const EdgeInsets.all(PaddingSize.p10),
              child: GestureDetector(
                onTap: (){
                  navigatePush(context, const ResetEmailView());
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: AppSize.s320.w,
                    height: AppSize.s96.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.darkGrey,
                        width: AppSize.s1.w,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppSize.s10,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: AppSize.s15.w,
                        ),
                        SvgPicture.asset(
                          ImagesAssetsManager.emailIc,
                          width: AppSize.s70.w,
                          height: AppSize.s70.h,
                          fit: BoxFit.scaleDown,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal:  AppSize.s20.w,
                            vertical: AppSize.s20.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text(
                                AppStrings.viaEmail,
                                style: getRegularStyleInter(
                                  color: ColorManager.viaPhone,
                                  fontSize: FontSize.s16.sp,
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s10.h,
                              ),
                              Text(
                                "... ...ab@mail.com",
                                style: getRegularStyleInter(
                                  color: ColorManager.viaPhone,
                                  fontSize: FontSize.s16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
