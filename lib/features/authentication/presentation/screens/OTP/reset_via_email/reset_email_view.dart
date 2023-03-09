import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:wevr_app/core/service/injection_container.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_cubit.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_states.dart';
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
  const ResetEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          OtpCubit(forgotPasswordUseCase: getIt(), checkOTPUseCase: getIt()),
      child: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ForgotPasswordSuccessState) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: StringsManager.info.tr(),
              text: state.forgotPassword.message,
              barrierDismissible: false,
              confirmBtnColor: Colors.amber,
              confirmBtnText: StringsManager.okay.tr(),
            );
          } else if (state is ForgotPasswordErrorState) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: StringsManager.error.tr(),
              text: state.error,
              confirmBtnText: StringsManager.okay.tr(),
            );
          }
        },
        builder: (context, state) {
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
                        title: StringsManager.recoveryCode.tr(),
                        subTitle: StringsManager.subTitleRecoveryCode.tr(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: PaddingSize.p78,
                        ),
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
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
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
                            const SizedBox(
                              width: AppSize.s15,
                            ),
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
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
                            const SizedBox(
                              width: AppSize.s15,
                            ),
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
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
                            const SizedBox(
                              width: AppSize.s15,
                            ),
                            Expanded(
                              child: Container(
                                width: AppSize.s60,
                                height: AppSize.s60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorManager.viaPhoneContainer,
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
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
                      Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: defaultButton(
                            function: () {
                              navigatePush(context, CreateNewPassword());
                            },
                            text: StringsManager.submit.tr(),
                            width: AppSize.s200.w,
                            height: AppSize.s60.h,
                            isUpperCase: false,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.resendCode.tr(),
                            style: getRegularStyleInter(
                              color: ColorManager.darkGrey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          defaultTextButton(
                            text: StringsManager.resend.tr(),
                            textColor: ColorManager.primary,
                            onPressed: () {
                              OtpCubit.get(context).forgotPassword();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
