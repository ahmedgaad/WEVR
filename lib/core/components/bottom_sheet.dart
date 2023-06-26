import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/authentication/presentation/screens/login/login_view.dart';
import 'package:wevr_app/features/authentication/presentation/screens/register/register_view.dart';
import 'package:wevr_app/features/user_profile/presentation/screens/contact_us/contact_us.dart';
import 'package:wevr_app/features/user_profile/presentation/screens/privacy_policy/privacy_policy.dart';

import 'components.dart';

void showBottomSheetWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 2,
              color: ColorManager.darkGrey,
            ),
            20.ph,
            Text(
              'Your Best Way Discover Your Perfect Apartment Or Sell Yours Effortlessly With Our Platform',
              style: getSemiBoldStylePoppins(fontSize: AppSize.s16),
              textAlign: TextAlign.center,
            ),
            50.ph,
            defaultButton(
              function: () {
                navigatePush(context, const LoginView());
              },
              text: 'login',
              borderRadius: 1,
              background: ColorManager.primary,
              isUpperCase: false,
              width: 299.w,
              height: 54.h,
            ),
            25.ph,
            defaultButton(
              function: () {
                navigatePush(context, const RegisterView());
              },
              text: 'sign up',
              borderRadius: 1,
              background: ColorManager.transparent,
              borderColor: ColorManager.primary,
              textColor: ColorManager.primary,
              isUpperCase: false,
              width: 299.w,
              height: 54.h,
            ),
            25.ph,
            SizedBox(
              width: 500,
              child: Text(
                "By continuing you agree to WEVR's",
                style: getMediumStylePoppins(
                  fontSize: AppSize.s14,
                  color: ColorManager.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle Terms and Conditions button press
                  },
                  child: Text('Terms and Conditions',
                      style: getSemiBoldStylePoppins(
                        fontSize: AppSize.s14,
                        color: ColorManager.primary,
                      )),
                ),
                Text(
                  ' and ',
                  style: getMediumStylePoppins(
                    fontSize: AppSize.s14,
                    color: ColorManager.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    navigatePush(context, const PrivacyPolicy());
                  },
                  child: Text( 'Privacy Policy',
                      style: getSemiBoldStylePoppins(
                        fontSize: AppSize.s14,
                        color: ColorManager.primary,
                      ),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Need more information?',
                  style: getMediumStylePoppins(
                    fontSize: AppSize.s14,
                    color: ColorManager.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    navigatePush(context, const ContactUs());
                  },
                  child: Text( 'Contact us',
                    style: getSemiBoldStylePoppins(
                      fontSize: AppSize.s14,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      );
    },
  );
}
