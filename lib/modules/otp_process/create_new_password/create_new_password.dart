import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/modules/otp_process/create_new_password/cubit/create_new_password_cubit.dart';
import 'package:wevr_app/modules/otp_process/reset_pass_successfuly.dart';
import 'package:wevr_app/shared/components/components.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:wevr_app/shared/managers/values_manager.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
            body: Column(
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
                      start: PaddingSize.p25.w, top: PaddingSize.p40.h),
                  child: Text(
                    AppStrings.createNewPasswordTitle,
                    style: getBoldStylePoppins(
                        color: ColorManager.black, fontSize: AppSize.s24),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: PaddingSize.p25.w),
                  child: Text(
                    AppStrings.createNewPasswordSubTitle,
                    style: getRegularStyleInter(
                      color: ColorManager.darkGrey,
                      fontSize: AppSize.s20,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
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
                                  fontSize: AppSize.s20),
                            ),
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixPressed: cubit.ChangePasswordVisibility,
                            //validate: "Must be at leaste 8 characters",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Must be not empty";
                              }
                              if (value.length < 8) {
                                return "Must be at leaste 8 characters";
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
                          child: defaultFormField(
                            onChange: (value) {
                              if (cubit.confirmPasswordController.text == cubit.passwordController.text) {
                                setState(() {
                                  cubit.isPasswordMatchCharacter = true;
                                });
                              }else{
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
                                  fontSize: AppSize.s20),
                            ),
                            isPassword: cubit.isPassword,
                            suffixWidget: cubit.isPasswordMatchCharacter
                                ? Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: PaddingSize.p11,
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
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        defaultButton(
                            function: () {
                              if (cubit.formKey.currentState!.validate()) {
                                navigatePush(context, ResetSuccessfully());
                              }
                            },
                            text: AppStrings.resetPassword,
                            isUpperCase: false,
                            width: 250.w,
                            height: 60.h),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
