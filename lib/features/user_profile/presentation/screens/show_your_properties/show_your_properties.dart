import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_profile/presentation/widgets/personal_information/form_field_widget.dart';

import '../../../../../core/utils/styles_manager.dart';

class ShowYourProperties extends StatelessWidget {
  const ShowYourProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        title: Text(
          'Show your properties',
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
              'Fill the form below to sign up as property owner and our team will contact you to get all details',
              style: getRegularStylePoppins(
                  fontSize: AppSize.s16, color: ColorManager.darkGrey),
              textAlign: TextAlign.center,
            ),
            35.ph,
            Text(
              'Name',
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
              'Mobile phone',
              style: getMediumStylePoppins(
                fontSize: AppSize.s16,
                color: ColorManager.darkGrey,
              ),
            ),
            10.ph,
            FormFieldWidget(
              height: 56.h,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Center(
                child: defaultButton(
                  function: () {},
                  text: 'Sign Up',
                  width: 280.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
