import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../user_dashboard/presentation/screens/home/home_view.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(ImagesAssetsManager.getStartedImage),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
            padding: EdgeInsets.all(PaddingSize.p40.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r41),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: AppSize.s20.w,
                        sigmaY: AppSize.s20.h,
                      ),
                      child: Container(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppSize.s44.h,
                        ),
                        Text(
                          AppStrings.welcomeTo.tr(),
                          style: getRegularStylePoppins(
                              color: ColorManager.black,
                              fontSize: FontSize.s24.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.all(PaddingSize.p50.w),
                          child: SvgPicture.asset(
                            ImagesAssetsManager.getStartedLogo,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s44.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(PaddingSize.p20.w),
                          child: Column(
                            children: [
                              defaultButton(
                                function: () {
                                  navigateTo(context, Routes.loginRoute);
                                },
                                isUpperCase: false,
                                text: AppStrings.signIn.tr(),
                              ),
                              SizedBox(
                                height: AppSize.s20.h,
                              ),
                              defaultButton(
                                borderColor: ColorManager.primary,
                                borderRadius: AppRadius.r2,
                                background: ColorManager.transparent,
                                function: () {
                                  navigateTo(context, Routes.registerRoute);
                                },
                                isUpperCase: false,
                                text: AppStrings.signUp.tr(),
                                textColor: ColorManager.black,
                              ),
                              SizedBox(
                                height: AppSize.s20.h,
                              ),
                              defaultTextButton(
                                textColor: ColorManager.black,
                                fontSize: FontSize.s18.sp,
                                textDecoration: TextDecoration.underline,
                                text: AppStrings.asGuest.tr(),
                                onPressed: () {
                                  navigatePush(context, const HomeView());
                                },
                              ),
                              // TextButton(
                              //     onPressed: (){},
                              //     child: const Text(
                              //       AppStrings.asGuest,
                              //       style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: ColorManager.black,
                              //         fontSize: AppSize.s16,
                              //       ),
                              //     ),
                              // ),
                            ],
                          ),
                        ),
                      ],
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
