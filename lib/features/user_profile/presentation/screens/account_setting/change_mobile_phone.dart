import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_profile/presentation/widgets/personal_information/form_field_widget.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import 'change_mobile_phone2.dart';

class ChangeMobilePhone extends StatelessWidget {
  const ChangeMobilePhone({Key? key}) : super(key: key);

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
            Center(
              child: SizedBox(
                width: 250.w,
                child: Text(
                  "please enter your password to continue",
                  style: getRegularStyleInter(
                    color: ColorManager.darkGrey,
                    fontSize: AppSize.s20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            80.ph,
            Text(
              'password',
              style: getRegularStylePoppins(
                  fontSize: AppSize.s16, color: ColorManager.smokyGray),
              textAlign: TextAlign.center,
            ),
            15.ph,
            FormFieldWidget(height: 56.h),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Center(
                child: defaultButton(
                  function: () {
                    navigatePush(context, const ChangeMobilePhoneNumber());
                  },
                  text: 'Continue',
                  isUpperCase: false,
                  width: 280.w
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
