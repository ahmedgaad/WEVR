import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/features/user_profile/presentation/screens/account_setting/change_password.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../widgets/personal_information/form_field_widget.dart';
import 'change_mobile_phone.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        title: Text(
          'Account Setting',
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
            Text(
              'Email',
              style: getMediumStylePoppins(
                fontSize: AppSize.s16,
                color: ColorManager.darkGrey,
              ),
            ),
            10.ph,
            FormFieldWidget(
              height: 56.h,
            ),
            35.ph,
            Text(
              'Password',
              style: getMediumStylePoppins(
                fontSize: AppSize.s16,
                color: ColorManager.darkGrey,
              ),
            ),
            10.ph,
            Stack(alignment: Alignment.centerRight, children: [
              FormFieldWidget(
                height: 56.h,
              ),
              defaultTextButton(
                text: 'Change',
                onPressed: () {
                  navigatePush(context, const ChangePasswordView());
                },
                textColor: ColorManager.primary,
              )
            ]),
            35.ph,
            Text(
              'Mobile phone',
              style: getMediumStylePoppins(
                fontSize: AppSize.s16,
                color: ColorManager.darkGrey,
              ),
            ),
            10.ph,
            Stack(alignment: Alignment.centerRight, children: [
              FormFieldWidget(
                height: 56.h,
              ),
              defaultTextButton(
                text: 'Change',
                onPressed: () {
                  navigatePush(context, const ChangeMobilePhone());
                },
                textColor: ColorManager.primary,
              )
            ]),

          ],
        ),
      ),
    );
  }
}
