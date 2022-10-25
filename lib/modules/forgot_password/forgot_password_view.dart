import 'package:flutter/material.dart';
import 'package:wevr_app/shared/components/components.dart';
import 'package:wevr_app/shared/managers/font_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';

import '../../shared/managers/assets_manager.dart';
import '../../shared/managers/color_manager.dart';
import '../../shared/managers/routes_manager.dart';
import '../../shared/managers/values_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      /*appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        leading: IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.all(PaddingSize.p20),
            child: Icon(
              Icons.arrow_back_ios,
              size: AppSize.s24,
            ),
          ),
        ),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Padding(
                  padding: EdgeInsets.all(PaddingSize.p25),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: AppSize.s24,
                  ),
                ),
              ),
              Align(
                child: SvgPicture.asset(
                  ImagesAssetsManager.forgotPass,
                  fit: BoxFit.scaleDown,
                  width: AppSize.s304,
                  height: AppSize.s264,
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
                padding: const EdgeInsets.all(PaddingSize.p10),
                child: GestureDetector(
                  onTap: (){
                    navigateTo(context, Routes.resetPhoneRoute);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: AppSize.s320,
                      height: AppSize.s96,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.darkGrey,
                          width: AppSize.s1,
                        ),
                        borderRadius: BorderRadius.circular(
                            AppSize.s10,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: AppSize.s15,
                          ),
                          SvgPicture.asset(
                            ImagesAssetsManager.phoneIc,
                            width: AppSize.s56,
                            height: AppSize.s56,
                            fit: BoxFit.scaleDown,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(PaddingSize.p20),
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
                                const SizedBox(
                                  height: AppSize.s10,
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
                    navigateTo(context, Routes.resetEmailRoute);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: AppSize.s320,
                      height: AppSize.s96,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.darkGrey,
                          width: AppSize.s1,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSize.s10,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: AppSize.s15,
                          ),
                          SvgPicture.asset(
                            ImagesAssetsManager.emailIc,
                            width: 70,
                            height: 70,
                            fit: BoxFit.scaleDown,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(PaddingSize.p20),
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
                                const SizedBox(
                                  height: AppSize.s10,
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
      ),
    );
  }
}
