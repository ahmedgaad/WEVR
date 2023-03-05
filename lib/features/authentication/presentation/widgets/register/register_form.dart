import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../controller/register/cubit.dart';
import '../../controller/register/states.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      // listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingSize.p40.w,
              ),
              child: defaultFormField(
                controller: cubit.userNameController,
                type: TextInputType.name,
                labelWidget: textInputInField(
                  StringsManager.userName.tr(),
                ),
                validate: (value) {
                  if (value!.isEmpty) {
                    return StringsManager.userName.tr();
                  }
                  return null;
                },
              ),
            ),
            10.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingSize.p40.w),
              child: defaultFormField(
                controller: cubit.emailController,
                type: TextInputType.emailAddress,
                // label: AppStrings.emailOrMobile,

                labelWidget: textInputInField(
                  StringsManager.emailAddress.tr(),
                ),
                //validate: AppStrings.emailValidate,
                validate: (value) {
                  if (value!.isEmpty) {
                    return StringsManager.emailError1.tr();
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return StringsManager.emailError2.tr();
                  }
                  return null;
                },
              ),
            ),
            10.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingSize.p40.w),
              child: defaultFormField(
                controller: cubit.phoneController,
                type: TextInputType.phone,
                // label: AppStrings.emailOrMobile,
                labelWidget: textInputInField(
                  StringsManager.mobile.tr(),
                ),
                //validate: AppStrings.emailValidate,
                validate: (value) {
                  if (value!.isEmpty) {
                    return StringsManager.phoneValidate.tr();
                  }
                  return null;
                },
              ),
            ),
            10.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingSize.p40.w),
              child: defaultFormField(
                onChange: (String value) {},
                controller: cubit.passwordController,
                type: TextInputType.visiblePassword,
                labelWidget: textInputInField(
                  StringsManager.password.tr(),
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
            10.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: PaddingSize.p40.w),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
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
                    labelWidget: textInputInField(
                      StringsManager.confirmPassword.tr(),
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
              height: AppSize.s20.h,
            ),
          ],
        );
      },
    );
  }

  Widget textInputInField(String text) {
    return Text(
      text,
      style: getRegularStylePoppins(
        color: ColorManager.darkGrey,
        fontSize: AppSize.s14.sp,
      ),
    );
  }
}
