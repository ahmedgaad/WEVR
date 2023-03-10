import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../../core/service/injection_container.dart';
import '../../../controller/OTP/otp_cubit.dart';
import '../../../controller/OTP/otp_states.dart';
import '../../../controller/login/cubit.dart';
import '../../../controller/login/states.dart';
import '../forgot_password_screen.dart';
import '../../../../../../core/components/components.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/fonts_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../widgets/forget_pass/forget_password_top_column.dart';
import '../reset_via_email/reset_email_view.dart';
import '../reset_via_phone/reset_phone_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(forgotPasswordUseCase: getIt(), checkOTPUseCase: getIt()),
      child: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                // elevation: AppSize.s0,
                ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ForgetPasswordTopColumn(
                    imagePath: AssetsImagesManager.forgotPass,
                    title: StringsManager.forgotPass.tr(),
                    subTitle: StringsManager.subTitleForgotPass.tr(),
                  ),
                  //via phone number
                  Padding(
                    padding: const EdgeInsets.all(PaddingSize.p10),
                    child: GestureDetector(
                      onTap: () {
                        navigatePush(context, const ResetPhoneView());
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: AppSize.s320.w,
                          height: AppSize.s96.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorManager.darkGrey,
                              width: AppSize.s1.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppSize.s10,
                            ),
                          ),
                          child: Row(
                            children: [
                              15.pw,
                              SvgPicture.asset(
                                AssetsImagesManager.phoneIc,
                                width: AppSize.s56.w,
                                height: AppSize.s56.h,
                                fit: BoxFit.scaleDown,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.s20.w,
                                  vertical: AppSize.s20.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringsManager.viaPhone.tr(),
                                      style: getRegularStyleInter(
                                        color: ColorManager.viaPhone,
                                        fontSize: FontSize.s16.sp,
                                      ),
                                    ),
                                    10.ph,
                                    Text(
                                      "... ...1234",
                                      style: getRegularStyleInter(
                                        color: ColorManager.viaPhone,
                                        fontSize: FontSize.s16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //via email
                  Padding(
                    padding: const EdgeInsets.all(PaddingSize.p10),
                    child: GestureDetector(
                      onTap: () {
                        navigatePush(context, ForgotPasswordScreen());
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: AppSize.s320.w,
                          height: AppSize.s96.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorManager.darkGrey,
                              width: AppSize.s1.w,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppSize.s10,
                            ),
                          ),
                          child: Row(
                            children: [
                              15.pw,
                              SvgPicture.asset(
                                AssetsImagesManager.emailIc,
                                width: AppSize.s70.w,
                                height: AppSize.s70.h,
                                fit: BoxFit.scaleDown,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.s20.w,
                                  vertical: AppSize.s20.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringsManager.viaEmail.tr(),
                                      style: getRegularStyleInter(
                                        color: ColorManager.viaPhone,
                                        fontSize: FontSize.s16.sp,
                                      ),
                                    ),
                                    10.ph,
                                    Text(
                                      '... ...ab@gmail.com',
                                      style: getRegularStyleInter(
                                        color: ColorManager.viaPhone,
                                        fontSize: FontSize.s16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
