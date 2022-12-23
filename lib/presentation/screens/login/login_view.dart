// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import '../../../core/components/components.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/managers/font_manager.dart';
import '../../../core/managers/routes_manager.dart';
import '../../../core/managers/strings_manager.dart';
import '../../../core/managers/style_manager.dart';
import '../../../core/managers/values_manager.dart';
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
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: ColorManager.transparent,
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.light,
    // ));

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
                  background(
                    context,
                    buttonText: AppStrings.signUp,
                    route: Routes.registerRoute,
                    questionText: AppStrings.haveAccount,
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
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            backButton(function: (){}),
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
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
                                                     const ForgotPasswordView());
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
                                            if(cubit.passFieldKey.currentState!.validate())
                                            {
                                              navigateTo(context, Routes.homeRoute);
                                              LoginCubit.get(context).userLogin(
                                                  email: LoginCubit.get(context).emailController.text,
                                                  password: LoginCubit.get(context).passwordController.text);
                                            }
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



