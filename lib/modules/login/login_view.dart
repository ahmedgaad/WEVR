import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/shared/components/components.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';
import 'package:wevr_app/shared/managers/font_manager.dart';
import 'package:wevr_app/shared/managers/routes_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/managers/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
            Expanded(
              flex: AppSize.s2.toInt(),
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppRadius.r93),
                    bottomRight: Radius.circular(AppRadius.r93),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                        PaddingSize.p70,
                    ),
                    child: Text(
                      AppStrings.haveAccount,
                      style: getRegularStyleInter(
                        color: ColorManager.darkGrey,
                        fontSize: AppSize.s16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s24.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(PaddingSize.p30),
                    child: defaultTextButton(
                      textColor: ColorManager.primary,
                        text: AppStrings.signUp,
                        onPressed: (){
                          navigateTo(context, Routes.registerRoute);
                        }
                    ),
                    // TextButton(
                    //     onPressed: () {
                    //       navigateTo(context, Routes.registerRoute);
                    //     },
                    //     child: Text(
                    //       AppStrings.signUp,
                    //       style: getRegularStyleInter(
                    //         color: ColorManager.primary,
                    //         fontSize: FontSize.s16,
                    //       ),
                    //     )),
                  ),
                ],
              ),
            ),
          ]
          ),
          Material(
            borderRadius: BorderRadius.circular(AppRadius.r41),
            elevation: AppSize.s8,
            color: ColorManager.transparent,
            child: Container(
              height: AppSize.s600.h,
              width: AppSize.s300.w,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppRadius.r41),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Padding(
                        padding: EdgeInsets.all(PaddingSize.p20),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: AppSize.s24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s24.h,
                    ),
                    Column(
                      children: [
                        Text(
                          AppStrings.loginAccount,
                          style: getSemiBoldStylePoppins(
                            color: ColorManager.primary,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                ImagesAssetsManager.googleIc,
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s20.w,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                ImagesAssetsManager.appleIc,
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s20.w,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                ImagesAssetsManager.facebookLogoIc,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s24.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: AppSize.s1.h,
                              width: AppSize.s200.w,
                              color: ColorManager.lightGrey,
                            ),
                            Container(
                              width: AppSize.s30.w,
                              height: AppSize.s12.h,
                              decoration: BoxDecoration(
                                color: ColorManager.orBackground,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    PaddingSize.p0
                                ),
                                child: Center(
                                  child: Text(
                                    AppStrings.or,
                                    style: getRegularStyleInter(
                                        color: ColorManager.black,
                                      fontSize: FontSize.s10.sp,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s24.h,
                        ),
                        Text(
                          AppStrings.loginWord,
                          style: getRegularStyleInter(
                            color: ColorManager.darkGrey,
                            fontSize: FontSize.s16.sp,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s24.h,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: PaddingSize.p40.w),
                      child: defaultFormField(
                        controller: TextEditingController(),
                        type: TextInputType.emailAddress,
                        label: AppStrings.emailOrMobile,
                        validate: AppStrings.emailValidate,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: PaddingSize.p40.w
                      ),
                      child: defaultFormField(
                        controller: TextEditingController(),
                        type: TextInputType.visiblePassword,
                        label: AppStrings.password,
                        validate: AppStrings.passwordValidate,
                        suffix: Icons.visibility_off,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              end: PaddingSize.p14
                          ),
                          child: defaultTextButton(
                              text: AppStrings.forgetPassword,
                              onPressed: (){
                                navigateTo(context, Routes.forgetPasswordRoute);
                              },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s24.h,
                    ),
                    Center(
                      child: defaultButton(
                        function: () {},
                        text: AppStrings.signIn,
                        width: AppSize.s200.w,
                        height: AppSize.s44.h,
                        isUpperCase: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//TextButton(
//                             onPressed: () {
//                               navigateTo(context, Routes.forgetPasswordRoute);
//                             },
//                             child: Text(
//                               AppStrings.forgetPassword,
//                               style: getLightStyleInter(
//                                 color: ColorManager.darkGrey,
//                                 fontSize: FontSize.s16,
//                               ),
//                             ),
//                           ),
