import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/components/components.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../widgets/forget_pass/forget_password_top_column.dart';
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
                  ForgetPasswordTopColumn(
                    imagePath: AssetsImagesManager.createNewPass,
                    title: StringsManager.createNewPasswordTitle.tr(),
                    subTitle: StringsManager.createNewPasswordSubTitle.tr(),
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
                              StringsManager.password.tr(),
                              style: getRegularStyleInter(
                                color: ColorManager.darkGrey,
                                fontSize: AppSize.s16.sp,
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
                          height: MediaQuery.of(context).size.height / 30,
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
                                  StringsManager.confirmPassword.tr(),
                                  style: getRegularStyleInter(
                                    color: ColorManager.darkGrey,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                                isPassword: cubit.isPassword,
                                suffixWidget: cubit.isPasswordMatchCharacter
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.only(
                                          end: PaddingSize.p10.w,
                                        ),
                                        child: SvgPicture.asset(
                                          AssetsImagesManager.checkIc,
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
                              navigatePush(context, const ResetSuccessfully());
                            }
                          },
                          text: StringsManager.resetPassword.tr(),
                          isUpperCase: false,
                          width: 250.w,
                          height: 50.h,
                        ),
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
