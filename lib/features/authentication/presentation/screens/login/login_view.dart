// ignore_for_file: avoid_print
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'package:wevr_app/features/authentication/presentation/screens/OTP/forgot_password/forgot_password_view.dart';
import 'package:wevr_app/features/authentication/presentation/widgets/login_register_background.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/dependency_injection/injection_container.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/constants_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../widgets/login/form_column.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        // if (state is LoginSuccessState) {
        //   if (state.loginModel.status != null) {
        //     print(state.loginModel.message);
        //     print(state.loginModel.token);

        //     CacheHelper.saveData(key: 'token', value: state.loginModel.token)
        //         .then((value) {
        //       ConstantsManager.token = state.loginModel.token!;
        //       Navigator.pushReplacementNamed(context, Routes.homeRoute);
        //     });
        //   }
        // }
      }, builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              LoginRegisterBackground(
                textButton: StringsManager.signUp.tr(),
                route: Routes.registerRoute,
                questionText: StringsManager.haveAccount.tr(),
                p1: PaddingSize.p60,
                p2: PaddingSize.p24,
              ),
              Material(
                borderRadius: BorderRadius.circular(AppRadius.r41),
                elevation: AppSize.s8,
                color: ColorManager.transparent,
                child: Container(
                  height: AppSize.s700.h,
                  width: AppSize.s300.w,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppRadius.r41),
                  ),
                  child: Column(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // backButton(function: () {}),
                          // SizedBox(
                          //   height: AppSize.s50.h,
                          // ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SocialColumn(
                                      // secondText: AppStrings.loginAccount.tr(),
                                      // firstText: AppStrings.loginWord.tr(),
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
                                        labelWidget: textInputInField(
                                            StringsManager.emailAddress.tr()),
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return StringsManager.emailError1
                                                .tr();
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return StringsManager.emailError2
                                                .tr();
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
                                          labelWidget: textInputInField(
                                              StringsManager.password.tr()),
                                          isPassword: cubit.isPassword,
                                          // validate: AppStrings.passwordValidate,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return StringsManager
                                                  .passwordValidate
                                                  .tr();
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
                                        padding: const EdgeInsetsDirectional
                                            .symmetric(
                                          horizontal: PaddingSize.p20,
                                        ),
                                        child: defaultTextButton(
                                          text: StringsManager.forgetPassword
                                              .tr(),
                                          onPressed: () {
                                            if (cubit.emailFormKey.currentState!
                                                .validate()) {
                                              navigatePush(context,
                                                  const ForgotPasswordView());
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: AppSize.s100.h,
                                  // ),
                                  20.ph,
                                  Center(
                                    child: defaultButton(
                                      function: () async {
                                        if (cubit.emailFormKey.currentState!
                                            .validate()) {
                                          if (cubit.passFieldKey.currentState!
                                              .validate()) {
                                            // cubit.userLogin(LoginModel(
                                            //   email: cubit.emailController.text,
                                            //   password:
                                            //       cubit.passwordController.text,
                                            //   deviceName:
                                            //       await cubit.getDeviceInfo(),
                                            // ));
                                          }
                                        }
                                      },
                                      text: StringsManager.signIn.tr(),
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
                  ]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
