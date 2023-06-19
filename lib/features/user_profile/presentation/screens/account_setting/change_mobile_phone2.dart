import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_profile/presentation/widgets/personal_information/form_field_widget.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/success_screen.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import 'change_mobile_success.dart';

class ChangeMobilePhoneNumber extends StatelessWidget {
  const ChangeMobilePhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        title: Text(
          'Change Mobile number',
          style: getBoldStylePoppins(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.ph,
            Center(
              child: SizedBox(
                width: 250.w,
                child: Text(
                  "please enter your new mobile number",
                  style: getRegularStyleInter(
                    color: ColorManager.darkGrey,
                    fontSize: AppSize.s20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            100.ph,
            Text(
              'New Mobile Number',
              style: getRegularStylePoppins(
                  fontSize: AppSize.s16, color: ColorManager.smokyGray),
              textAlign: TextAlign.center,
            ),
            15.ph,
            FormFieldWidget(height: 56.h),
            Spacer(),
            Row(
              children: [
                defaultButton(
                  function: () {
                    navigatePush(context, const ChangeMobileSuccessfully());
                  },
                  text: 'Save',
                  width: 153.w,
                  isUpperCase: false,
                ),
                10.pw,
                defaultButton(
                    function: () {},
                    text: 'Cancel',
                    width: 153.w,
                    isUpperCase: false,
                    borderColor: ColorManager.primary,
                    background: ColorManager.white,
                    textColor: ColorManager.primary,
                    borderRadius: 1
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
