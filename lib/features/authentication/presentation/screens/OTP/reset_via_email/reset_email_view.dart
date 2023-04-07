import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../../core/service/service_locator.dart';
import '../../../controller/OTP/otp_cubit.dart';
import '../../../controller/OTP/otp_states.dart';
import '../../../widgets/forget_pass/forget_password_top_column.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/components/components.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/fonts_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../widgets/forget_pass/via_phone_or_mail.dart';
import '../create_new_password/create_new_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';

class ResetEmailView extends StatelessWidget {
  const ResetEmailView({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {
        if (state is CheckOTPSuccessState) {
          if (state.checkOTP.status == 1) {
            navigatePush(
              context,
              CreateNewPasswordView(
                email: email,
              ),
            );
          }
        } else if (state is CheckOTPErrorState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: StringsManager.error.tr,
            text: state.error,
            confirmBtnText: StringsManager.okay.tr,
          );
        } else if (state is ResetViaEmailSuccessState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.info,
            title: StringsManager.info.tr,
            text: state.forgotPassword.message,
            barrierDismissible: false,
            confirmBtnColor: Colors.amber,
            confirmBtnText: StringsManager.okay.tr,
          );
        } else if (state is ResetViaEmailErrorState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: StringsManager.error.tr,
            text: state.error,
            confirmBtnText: StringsManager.okay.tr,
            confirmBtnColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        var cubit = OtpCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ForgetPasswordTopColumn(
                      imagePath: AssetsImagesManager.emailReset,
                      title: StringsManager.recoveryCode.tr,
                      subTitle: StringsManager.subTitleRecoveryCode.tr,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PaddingSize.p78,
                      ),
                      child: Form(
                        key: cubit.formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  controller: cubit.firstCodeController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "8", border: InputBorder.none),
                                  style: getBoldStylePoppins(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s24.sp,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                            ),
                            15.pw,
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  controller: cubit.secondCodeController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "-",
                                    border: InputBorder.none,
                                  ),
                                  style: getBoldStylePoppins(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s24.sp,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                            ),
                            15.pw,
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  controller: cubit.thirdCodeController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "-",
                                    border: InputBorder.none,
                                  ),
                                  style: getBoldStylePoppins(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s24.sp,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                            ),
                            15.pw,
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  controller: cubit.fourthCodeController,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "-",
                                    border: InputBorder.none,
                                  ),
                                  style: getBoldStylePoppins(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s24.sp,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: ConditionalBuilder(
                          condition: state is! CheckOTPLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                              function: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.checkOTP(email: email);
                                }
                              },
                              text: StringsManager.submit.tr,
                              width: AppSize.s200.w,
                              height: AppSize.s60.h,
                              isUpperCase: false,
                            );
                          },
                          fallback: (BuildContext context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    ConditionalBuilder(
                      condition: state is! ResetViaEmailLoadingState,
                      builder: (BuildContext context) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringsManager.resendCode.tr,
                              style: getRegularStyleInter(
                                color: ColorManager.darkGrey,
                                fontSize: FontSize.s14,
                              ),
                            ),
                            defaultTextButton(
                              text: StringsManager.resend.tr,
                              textColor: ColorManager.primary,
                              onPressed: () {
                                cubit.forgotPassword(email: email);
                              },
                            )
                          ],
                        );
                      },
                      fallback: (BuildContext context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
