import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.privacy.tr,
            style: getBoldStylePoppins(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                StringsManager.policyTopic.tr,
                style: getRegularStyleInter(fontSize: 16.0),
              ),
            ],
          ),
        ));
  }
}
