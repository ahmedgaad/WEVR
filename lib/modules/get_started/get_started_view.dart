import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';
import 'package:wevr_app/shared/managers/routes_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:wevr_app/shared/managers/values_manager.dart';
import '../../shared/components/components.dart';
import '../../shared/managers/font_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingSize.p40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r41),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BackdropFilter(
                        filter: ImageFilter.blur
                          (
                          sigmaX: AppSize.s20,
                          sigmaY: AppSize.s20,
                        ),
                      child: Container(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         const SizedBox(
                          height: AppSize.s44,
                        ),
                        Text(
                          AppStrings.welcomeTo,
                          style: getRegularStylePoppins(
                              color: ColorManager.black,
                              fontSize: FontSize.s24.sp
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(PaddingSize.p50),
                          child: SvgPicture.asset(
                              ImagesAssetsManager.getStartedLogo,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s44,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(PaddingSize.p20),
                          child: Column(
                            children: [
                              defaultButton(
                                  function: (){
                                   navigateTo(context, Routes.loginRoute);
                                  },
                                isUpperCase: false,
                                  text: AppStrings.signIn,
                              ),
                              const SizedBox(
                                height: AppSize.s20,
                              ),
                              defaultButton(
                                borderColor: ColorManager.primary,
                                borderRadius: AppRadius.r2,
                                background: ColorManager.transparent,
                                function: (){
                                  navigateTo(context, Routes.registerRoute);
                                },
                                isUpperCase: false,
                                text: AppStrings.signUp,
                                textColor: ColorManager.black,
                              ),
                              const SizedBox(
                                height: AppSize.s20,
                              ),
                              defaultTextButton(
                                textColor: ColorManager.black,
                                  fontSize: FontSize.s18.sp,
                                  textDecoration: TextDecoration.underline,
                                  text: AppStrings.asGuest,
                                  onPressed: (){},
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


