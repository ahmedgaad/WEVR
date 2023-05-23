import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

import '../../../../core/utils/styles_manager.dart';
import '../screens/onboarding/onboarding_view.dart';

class ItemSlider extends StatelessWidget {
  const ItemSlider({super.key, required this.object});
  final SliderObject object;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s36.h,
            ),
            SvgPicture.asset(
              object.image,
              height: AppSize.s300.h,
              width: AppSize.s281_25.w,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: AppSize.s24.h,
            ),
            Text(
              object.title,
              textAlign: TextAlign.center,
              style: getRegularStylePoppins(
                fontSize: AppSize.s20,
              ),
            ),
            SizedBox(
              height: AppSize.s15.h,
            ),
            SizedBox(
              width: 200,
              child: Text(
                object.subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      );
  }
}
