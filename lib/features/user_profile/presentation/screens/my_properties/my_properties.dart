import 'package:flutter/material.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/assets_manager.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

import '../../../../../core/utils/styles_manager.dart';
import '../show_your_properties/show_your_properties.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        title: Text(
          'My properties',
          style: getBoldStylePoppins(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(AssetsImagesManager.myProperty),
            ),
            Text(
              'There are No properties for you yet',
              style: getBoldStyleInter(
                color: Colors.black,
                fontSize: AppSize.s16,
              ),
            ),
            25.ph,
            Text(
              'Contact our team to join our users and help you advertise your properties',
              style: getRegularStylePoppins(
                fontSize: AppSize.s14,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 20,
              ),
              child: defaultButton(
                isUpperCase: false,
                function: () {
                  navigatePush(context, const ShowYourProperties());
                },
                text: 'Show your property',
              ),
            )
          ],
        ),
      ),
    );
  }
}
