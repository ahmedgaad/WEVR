import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/components.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../reset_pass_successfully.dart';
import 'cubit/create_new_password_cubit.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewPasswordCubit(),
      child: BlocConsumer<CreateNewPasswordCubit, CreateNewPasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CreateNewPasswordCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              elevation: AppSize.s0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: SvgPicture.asset(
                      ImagesAssetsManager.createNewPass,
                      width: AppSize.s192.w,
                      height: AppSize.s192.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: PaddingSize.p25.w,
                      top: PaddingSize.p40.h,
                    ),
                    child: Text(
                      AppStrings.createNewPasswordTitle,
                      style: getBoldStylePoppins(
                        color: ColorManager.black,
                        fontSize: AppSize.s24.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: PaddingSize.p25.w),
                    child: Text(
                      AppStrings.createNewPasswordSubTitle,
                      style: getRegularStyleInter(
                        color: ColorManager.darkGrey,
                        fontSize: AppSize.s20.sp,
                      ),
                    ),
                  ),
                  Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: PaddingSize.p25.w,
                            end: PaddingSize.p40.w,
                          ),
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
                            suffixPressed: cubit.ChangePasswordVisibility,
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
                          height: MediaQuery.of(context).size.height / 23,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: PaddingSize.p25.w,
                            end: PaddingSize.p40.w,
                          ),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        defaultButton(
                            function: () {
                              if (cubit.formKey.currentState!.validate()) {
                                navigatePush(
                                    context, const ResetSuccessfully());
                              }
                            },
                            text: AppStrings.resetPassword,
                            isUpperCase: false,
                            width: 250.w,
                            height: 60.h),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
