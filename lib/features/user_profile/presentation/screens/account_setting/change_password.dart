import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../widgets/personal_information/form_field_widget.dart';
import 'change_password_successfully.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        title: Text(
          'Change Password',
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
            Text(
              'your new password must be different from previous used passwords',
              style: getRegularStyleInter(
                color: ColorManager.darkGrey,
                fontSize: AppSize.s16,
              ),
            ),
            35.ph,
            Text(
              'Old Password',
              style: getRegularStylePoppins(
                  fontSize: AppSize.s16, color: ColorManager.smokyGray),
              textAlign: TextAlign.center,
            ),
            10.ph,
            const FormFieldWidget(height: 56,),
            35.ph,
            Text(
              'New Password',
              style: getRegularStylePoppins(
                  fontSize: AppSize.s16, color: ColorManager.smokyGray),
              textAlign: TextAlign.center,
            ),
            10.ph,
            const FormFieldWidget(height: 56,),
            30.ph,
            Text(
              'Confirm Password',
              style: getRegularStylePoppins(
                  fontSize: AppSize.s16, color: ColorManager.smokyGray),
              textAlign: TextAlign.center,
            ),
            10.ph,
            const FormFieldWidget(height: 56,),
            Spacer(),
            Row(
              children: [
                defaultButton(
                  function: () {
                    navigatePush(context, const ChangePasswordSuccessfully());
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
