// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/core/injection_container.dart';
import 'package:wevr_app/core/utils/constants_manager.dart';
import 'package:wevr_app/data/data_sources/local_data_source/cache_helper.dart';
import 'package:wevr_app/data/models/register_model/register_model.dart';
import 'package:wevr_app/presentation/widgets/login_widgets/social_icon.dart';
import '../../../core/components/components.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/fonts_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../../../core/utils/strings_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../../../core/utils/values_manager.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'register_successfully.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return BlocProvider(
        create: (BuildContext context) =>
            RegisterCubit(registerNewUserUseCase: getIt()),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              if (state.registerModel.status != null) {
                print(state.registerModel.message);
                print(state.registerModel.token);

                CacheHelper.saveData(
                    key: 'token',
                    value: state.registerModel.token).then((value){
                      AppConstants.token = state.registerModel.token!;
                      Navigator.pushReplacementNamed(context, Routes.registerSuccessRoute);
                });
              }
            }
          },
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  background(
                    context,
                    buttonText: AppStrings.signIn,
                    route: Routes.loginRoute,
                    questionText: AppStrings.alreadyHaveAccount,
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                backButton(function: () {}),
                                SizedBox(
                                  height: AppSize.s2.h,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                AppStrings.signUp,
                                                style: getSemiBoldStylePoppins(
                                                  color: ColorManager.primary,
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppSize.s20.h,
                                              ),
                                              const SocialButtons(),
                                              SizedBox(
                                                height: AppSize.s20.h,
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
                                                      color:
                                                          ColorManager.orBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppRadius.r20),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(
                                                          PaddingSize.p0),
                                                      child: Center(
                                                        child: Text(
                                                          AppStrings.or,
                                                          style:
                                                              getRegularStyleInter(
                                                            color:
                                                                ColorManager.black,
                                                            fontSize:
                                                                FontSize.s10.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: AppSize.s20.h,
                                              ),
                                              Text(
                                                AppStrings.registerWord,
                                                style: getRegularStyleInter(
                                                  color: ColorManager.darkGrey,
                                                  fontSize: FontSize.s16.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppSize.s10.h,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: PaddingSize.p40.w),
                                            child: defaultFormField(
                                              controller: cubit.userNameController,
                                              type: TextInputType.name,
                                              // label: AppStrings.emailOrMobile,
                                              labelWidget: Text(
                                                AppStrings.userName,
                                                style: getRegularStyleInter(
                                                  color: ColorManager.darkGrey,
                                                  fontSize: AppSize.s20.sp,
                                                ),
                                              ),
                                              //validate: AppStrings.emailValidate,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return AppStrings.userName;
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSize.s10.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: PaddingSize.p40.w),
                                            child: defaultFormField(
                                              controller: cubit.emailController,
                                              type: TextInputType.emailAddress,
                                              // label: AppStrings.emailOrMobile,
                                              labelWidget: Text(
                                                AppStrings.emailAddress,
                                                style: getRegularStyleInter(
                                                  color: ColorManager.darkGrey,
                                                  fontSize: AppSize.s20.sp,
                                                ),
                                              ),
                                              //validate: AppStrings.emailValidate,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return AppStrings.emailValidate;
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSize.s10.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: PaddingSize.p40.w),
                                            child: defaultFormField(
                                              controller: cubit.phoneController,
                                              type: TextInputType.phone,
                                              // label: AppStrings.emailOrMobile,
                                              labelWidget: Text(
                                                AppStrings.mobile,
                                                style: getRegularStyleInter(
                                                  color: ColorManager.darkGrey,
                                                  fontSize: AppSize.s20.sp,
                                                ),
                                              ),
                                              //validate: AppStrings.emailValidate,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return AppStrings.phoneValidate;
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSize.s10.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: PaddingSize.p40.w),
                                            child: defaultFormField(
                                              onChange: (String value) {},
                                              controller: cubit.passwordController,
                                              type: TextInputType.visiblePassword,
                                              labelWidget: Text(
                                                AppStrings.password,
                                                style: getRegularStyleInter(
                                                  color: ColorManager.darkGrey,
                                                  fontSize: AppSize.s20.sp,
                                                ),
                                              ),
                                              isPassword: cubit.isPassword,
                                              suffix: cubit.suffix,
                                              suffixPressed:
                                                  cubit.changePasswordVisibility,
                                              //validate: "Must be at least 8 characters",
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return "Must be not empty";
                                                }
                                                if (value.length < 8) {
                                                  return "Must be at least 8 characters";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSize.s10.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: PaddingSize.p40.w),
                                            child: StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return defaultFormField(
                                                  onChange: (value) {
                                                    if (cubit
                                                            .confirmPasswordController
                                                            .text ==
                                                        cubit.passwordController
                                                            .text) {
                                                      setState(() {
                                                        cubit.isPasswordMatchCharacter =
                                                            true;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        cubit.isPasswordMatchCharacter =
                                                            false;
                                                      });
                                                    }
                                                  },
                                                  controller: cubit
                                                      .confirmPasswordController,
                                                  type:
                                                      TextInputType.visiblePassword,
                                                  labelWidget: Text(
                                                    AppStrings.confirmPassword,
                                                    style: getRegularStyleInter(
                                                      color: ColorManager.darkGrey,
                                                      fontSize: AppSize.s20.sp,
                                                    ),
                                                  ),
                                                  isPassword: cubit.isPassword,
                                                  suffixWidget: cubit
                                                          .isPasswordMatchCharacter
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .only(
                                                            end: PaddingSize.p10.w,
                                                          ),
                                                          child: SvgPicture.asset(
                                                            ImagesAssetsManager
                                                                .checkIc,
                                                            width: AppSize.s24.w,
                                                            height: AppSize.s24.h,
                                                          ),
                                                        )
                                                      : const SizedBox.shrink(),
                                                  //validate: "Both passwords must match",
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Must be not empty";
                                                    }
                                                    if (cubit.passwordController
                                                            .text !=
                                                        cubit
                                                            .confirmPasswordController
                                                            .text) {
                                                      return "Both passwords must match";
                                                    }
                                                    return null;
                                                  },
                                                  // suffix: Icons.check_circle_outline,
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSize.s20.h,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: ConditionalBuilder(
                                                condition:
                                                    state is! RegisterLoadingState,
                                                builder: (BuildContext context) {
                                                  return defaultButton(
                                                    function: () async{
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        cubit.userRegister(RegisterModel(
                                                          name: cubit.userNameController.text,
                                                          email: cubit.emailController.text,
                                                          phone: cubit.phoneController.text,
                                                          password: cubit.passwordController.text,
                                                          confirmPassword: cubit.confirmPasswordController.text,
                                                          deviceName: await cubit.getDeviceInfo(),
                                                        ));
                                                      }
                                                    },
                                                    text: AppStrings.signUp,
                                                    width: AppSize.s200.w,
                                                    height: AppSize.s44.h,
                                                    isUpperCase: false,
                                                  );
                                                },
                                                fallback: (BuildContext context) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
