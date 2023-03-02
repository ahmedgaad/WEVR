import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/components/components.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/fonts_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../widgets/forget_pass/forget_password_top_column.dart';
import '../reset_via_email/reset_email_view.dart';
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
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
             ForgetPasswordTopColumn(
              imagePath: AssetsImagesManager.forgotPass,
              title: AppStrings.forgotPass.tr(),
              subTitle: AppStrings.subTitleForgotPass.tr(),
            ),
            //via phone number
            Padding(
              padding: const EdgeInsets.all(PaddingSize.p10),
              child: GestureDetector(
                onTap: () {
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
                          AssetsImagesManager.phoneIc,
                          width: AppSize.s56.w,
                          height: AppSize.s56.h,
                          fit: BoxFit.scaleDown,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s20.w,
                            vertical: AppSize.s20.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.viaPhone.tr(),
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
                onTap: () {
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
                          AssetsImagesManager.emailIc,
                          width: AppSize.s70.w,
                          height: AppSize.s70.h,
                          fit: BoxFit.scaleDown,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s20.w,
                            vertical: AppSize.s20.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.viaEmail.tr(),
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
