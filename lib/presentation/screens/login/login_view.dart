// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../shared/components/components.dart';
import '../../../shared/managers/color_manager.dart';
import '../../../shared/managers/font_manager.dart';
import '../../../shared/managers/routes_manager.dart';
import '../../../shared/managers/strings_manager.dart';
import '../../../shared/managers/style_manager.dart';
import '../../../shared/managers/values_manager.dart';
import '../../widgets/login_widgets/social_icon.dart';
import '../otp_screens/forgot_password/forgot_password_view.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Column(children: [
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
                                onPressed: () {
                                  navigateTo(context, Routes.registerRoute);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ]),
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
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Padding(
                                padding: EdgeInsets.all(PaddingSize.p20),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: AppSize.s24,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                        const SocialButtons(),
                                        SizedBox(
                                          height: AppSize.s24.h,
                                        ),
                                        emailStack(),
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
                                      child: Form(
                                        key: cubit.emailFormKey,
                                        child: defaultFormField(
                                          controller: cubit.emailController,
                                          type: TextInputType.emailAddress,
                                          // label: AppStrings.emailOrMobile,
                                          labelWidget: Text(
                                            AppStrings.emailAddress,
                                            style: getRegularStylePoppins(
                                                color: ColorManager.darkGrey,
                                              fontSize: AppSize.s20.sp,
                                            ),
                                          ),
                                          validate: (value) {
                                              if (value!.isEmpty) {
                                                return AppStrings.emailValidate;
                                              }
                                              return null;
                                            },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSize.s20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: PaddingSize.p40.w),
                                      child: Form(
                                        key: cubit.passFieldKey,
                                        child: defaultFormField(
                                            controller: cubit.passwordController,
                                            type: TextInputType.visiblePassword,
                                            // label: AppStrings.password,
                                            labelWidget: Text(
                                              AppStrings.password,
                                              style: getRegularStylePoppins(
                                                color: ColorManager.darkGrey,
                                                fontSize: AppSize.s20.sp,
                                              ),
                                            ),
                                            isPassword: cubit.isPassword,
                                            // validate: AppStrings.passwordValidate,
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return AppStrings.passwordValidate;
                                              }
                                              return null;
                                            },
                                            suffix: cubit.suffix,
                                            suffixPressed: () {
                                              cubit.changePasswordVisibility();
                                            }),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.only(
                                              end: PaddingSize.p14),
                                          child: defaultTextButton(
                                            text: AppStrings.forgetPassword,
                                            onPressed: () {
                                              if (cubit.emailFormKey.currentState!.validate()) {
                                                navigatePush(context,
                                                     ForgotPasswordView());
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppSize.s20.h,
                                    ),
                                    Center(
                                      child: defaultButton(
                                        function: () {
                                          if (cubit.emailFormKey.currentState!
                                              .validate()) {
                                            navigateTo(context, Routes.homeRoute);
                                          }
                                          if(cubit.passFieldKey.currentState!.validate()){
                                            navigateTo(context, Routes.homeRoute);
                                          }
                                        },
                                        text: AppStrings.signIn,
                                        width: AppSize.s200.w,
                                        height: AppSize.s44.h,
                                        isUpperCase: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

Widget emailStack(){
  return Stack(
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
          borderRadius: BorderRadius.circular(
              AppRadius.r20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              PaddingSize.p0),
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
  );
}
