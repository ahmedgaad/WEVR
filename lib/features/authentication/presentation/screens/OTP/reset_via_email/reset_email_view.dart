import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class ResetEmailView extends StatefulWidget {
  const ResetEmailView({Key? key}) : super(key: key);

  @override
  State<ResetEmailView> createState() => _ResetEmailViewState();
}

class _ResetEmailViewState extends State<ResetEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
      ),
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
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
