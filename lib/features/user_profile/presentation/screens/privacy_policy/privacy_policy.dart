import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.privacy.tr(),
            style: getBoldStylePoppins(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                AppStrings.policyTopic.tr(),
                style: getRegularStyleInter(fontSize: 16.0),
              ),
            ],
          ),
        ));
  }
}
