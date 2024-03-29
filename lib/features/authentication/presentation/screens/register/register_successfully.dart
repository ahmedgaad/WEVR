import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/components/success_screen.dart';
import '../../../../../core/config/routes/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class RegisterSuccessfully extends StatelessWidget {
  const RegisterSuccessfully({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSize.s40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SuccessScreen(
                title: StringsManager.registerSuccessfully.tr,
                subTitle: StringsManager.registerSuccess.tr,
              ),
              defaultButton(
                width: AppSize.s280.w,
                function: () {
                  navigateTo(context, Routes.loginRoute);
                },
                text: StringsManager.continuee.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
