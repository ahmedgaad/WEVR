import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wevr_app/presentation/resources/assets_manager.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';
import 'package:wevr_app/presentation/resources/components.dart';
import 'package:wevr_app/presentation/resources/routes_manager.dart';
import 'package:wevr_app/presentation/resources/strings_manager.dart';
import 'package:wevr_app/presentation/resources/style_manager.dart';
import 'package:wevr_app/presentation/resources/values_manager.dart';

import '../resources/font_manager.dart';

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
              borderRadius: BorderRadius.circular(41),
              child:  Stack(
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
                  SingleChildScrollView(
                    child: Column(
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
                              fontSize: FontSize.s24
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
                                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                                  },
                                isUpperCase: false,
                                  text: AppStrings.signIn,
                              ),
                              const SizedBox(
                                height: AppSize.s20,
                              ),
                              defaultButton(
                                function: (){
                                  Navigator.pushReplacementNamed(context, Routes.registerRoute);
                                },
                                borderColor: ColorManager.primary,
                                borderRadius: AppSize.s2,
                                background: ColorManager.transparent,
                                isUpperCase: true,
                                text: AppStrings.signUp,
                                textColor: ColorManager.black,
                              ),
                              const SizedBox(
                                height: AppSize.s44,
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Routes.homeRoute);
                                  },
                                  child: const Text(
                                    AppStrings.asGuest,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: ColorManager.black,
                                      fontSize: AppSize.s16,
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


