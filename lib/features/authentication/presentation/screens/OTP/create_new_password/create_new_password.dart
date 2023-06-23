import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../../core/components/components.dart';
import '../../../../../../core/service/service_locator_imports.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../controller/create_new_password/cubit.dart';
import '../../../widgets/forget_pass/forget_password_top_column.dart';
import '../reset_pass_successfully.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateNewPasswordCubit(createNewPasswordUseCase: sl()),
      child: BlocConsumer<CreateNewPasswordCubit, CreateNewPasswordStates>(
        listener: (context, state) {
          if (state is CreateNewPasswordErrorState) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: StringsManager.error.tr,
                text: state.error,
                confirmBtnText: StringsManager.okay.tr,
                confirmBtnColor: Colors.red);
          } else if (state is CreateNewPasswordSuccessState) {
            navigatePush(context, const ResetSuccessfully());
          }
        },
        builder: (context, state) {
          var cubit = CreateNewPasswordCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: AppSize.s0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ForgetPasswordTopColumn(
                    imagePath: AssetsImagesManager.createNewPass,
                    title: StringsManager.createNewPasswordTitle.tr,
                    subTitle: StringsManager.createNewPasswordSubTitle.tr,
                  ),
                  Form(
                    key: cubit.passFormKey,
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
                              StringsManager.password.tr,
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
                                  StringsManager.confirmPassword.tr,
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
                            if (cubit.passFormKey.currentState!.validate()) {
                              cubit.createNewPassword(
                                email: email,
                                password: cubit.passwordController.text,
                                passwordConfirmation:
                                    cubit.confirmPasswordController.text,
                              );
                            }
                          },
                          text: StringsManager.resetPassword.tr,
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
