import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/components/components.dart';
import '../../../core/managers/assets_manager.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/managers/font_manager.dart';
import '../../../core/managers/routes_manager.dart';
import '../../../core/managers/strings_manager.dart';
import '../../../core/managers/style_manager.dart';
import '../../../core/managers/values_manager.dart';
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
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
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
                            padding: const EdgeInsets.all(PaddingSize.p50),
                            child: Text(
                              AppStrings.alreadyHaveAccount,
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
                            padding: const EdgeInsets.all(PaddingSize.p10),
                            child: defaultTextButton(
                                textColor: ColorManager.primary,
                                text: AppStrings.signIn,
                                onPressed: () {
                                  navigateTo(context, Routes.loginRoute);
                                }),

                            // TextButton(
                            //     onPressed: (){
                            //       Navigator.pushReplacementNamed(context, Routes.loginRoute);
                            //     },
                            //     child: Text(
                            //       AppStrings.signIn,
                            //       style: getRegularStyleInter(
                            //         color: ColorManager.primary,
                            //         fontSize: FontSize.s16,
                            //       ),
                            //     )
                            // ),
                          )
                        ],
                      ),
                    ),
                  ]),
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
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                          ),
                                          SizedBox(
                                            height: AppSize.s24.h,
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
                                          controller: cubit
                                              .userNameController,
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
                                          controller: cubit
                                              .emailController,
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
                                          controller: cubit
                                              .phoneController,
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
                                          suffixPressed: cubit.changePasswordVisibility,
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
                                          builder:
                                              (BuildContext context, StateSetter setState) {
                                            return defaultFormField(
                                              onChange: (value) {
                                                if (cubit.confirmPasswordController.text ==
                                                    cubit.passwordController.text) {
                                                  setState(() {
                                                    cubit.isPasswordMatchCharacter = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    cubit.isPasswordMatchCharacter = false;
                                                  });
                                                }
                                              },
                                              controller: cubit.confirmPasswordController,
                                              type: TextInputType.visiblePassword,
                                              labelWidget: Text(
                                                AppStrings.confirmPassword,
                                                style: getRegularStyleInter(
                                                  color: ColorManager.darkGrey,
                                                  fontSize: AppSize.s20.sp,
                                                ),
                                              ),
                                              isPassword: cubit.isPassword,
                                              suffixWidget: cubit.isPasswordMatchCharacter
                                                  ? Padding(
                                                padding:
                                                EdgeInsetsDirectional.only(
                                                  end: PaddingSize.p10.w,
                                                ),
                                                child: SvgPicture.asset(
                                                  ImagesAssetsManager.checkIc,
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
                                                if (cubit.passwordController.text !=
                                                    cubit.confirmPasswordController.text) {
                                                  return "Both passwords must match";
                                                }
                                                return null;
                                              },
                                              // suffix: Icons.check_circle_outline,
                                            );
                                          },
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: PaddingSize.p40.w),
                                      //   child: defaultFormField(
                                      //       controller: cubit
                                      //           .passwordController,
                                      //       type: TextInputType.visiblePassword,
                                      //       label: AppStrings.password,
                                      //       //validate: AppStrings.passwordValidate,
                                      //       validate: (value) {
                                      //         if (value!.isEmpty) {
                                      //           return AppStrings.passwordValidate;
                                      //         }
                                      //         return null;
                                      //       },
                                      //       isPassword:
                                      //           cubit.isPassword,
                                      //       suffix: cubit.suffix,
                                      //       suffixPressed: () {
                                      //         cubit
                                      //             .changePasswordVisibility();
                                      //       }),
                                      // ),
                                      // SizedBox(
                                      //   height: AppSize.s20.h,
                                      // ),
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: PaddingSize.p40.w),
                                      //   child: defaultFormField(
                                      //       controller: cubit
                                      //           .confirmPasswordController,
                                      //       type: TextInputType.visiblePassword,
                                      //       label: AppStrings.confirmPassword,
                                      //       //validate: AppStrings.passwordValidate,
                                      //       validate: (value) {
                                      //         if (value!.isEmpty) {
                                      //           return AppStrings.passwordValidate;
                                      //         }
                                      //         return null;
                                      //       },
                                      //       isPassword:
                                      //           cubit.isPassword,
                                      //       suffix: cubit
                                      //           .confirmSuffix,
                                      //       suffixPressed: () {
                                      //         cubit
                                      //             .changeSuffixPasswordVisibility();
                                      //       }),
                                      // ),
                                      SizedBox(
                                        height: AppSize.s20.h,
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: defaultButton(
                                            function: () {
                                              if (formKey.currentState!.validate()) {
                                                navigatePush(context,
                                                    const RegisterSuccessfully());
                                              }
                                            },
                                            text: AppStrings.signUp,
                                            width: AppSize.s200.w,
                                            height: AppSize.s44.h,
                                            isUpperCase: false,
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
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
