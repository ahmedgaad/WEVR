import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/managers/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            const Expanded(
                child: SizedBox(
                  height: AppSize.s20,
                )),
          ]),
          Material(
            borderRadius: BorderRadius.circular(AppRadius.r41),
            elevation: AppSize.s8,
            color: ColorManager.transparent,
            child: Container(
              height: 600.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppRadius.r41),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const Padding(
                        padding: EdgeInsets.all(PaddingSize.p20),
                        child: Icon(Icons.arrow_back_ios , size: AppSize.s24,),
                      ),
                  ),
                  const SizedBox(
                    height: AppSize.s24,
                  ),
                  Column(
                    children: [
                      Text(
                          AppStrings.loginAccount,
                        style: getSemiBoldStylePoppins(
                            color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset(
                              ImagesAssetsManager.googleIc,
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s20,
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset(
                              ImagesAssetsManager.appleIc,
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s20,
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset(
                              ImagesAssetsManager.facebookLogoIc,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s24,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 1.0,
                            width: 200.0,
                            color: ColorManager.lightGrey,
                          ),
                          Container(
                            width: 30.0,
                            height: AppSize.s24,
                            decoration: BoxDecoration(
                              color: ColorManager.orBackground,
                              borderRadius: BorderRadius.circular(AppRadius.r20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(PaddingSize.p4),
                              child: Center(
                                  child: Text(
                                    AppStrings.or,
                                  ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(PaddingSize.p40),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text(
                            AppStrings.emailOrMobile,
                        ),
                      ),
                    ),
                  ),
                ],
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
