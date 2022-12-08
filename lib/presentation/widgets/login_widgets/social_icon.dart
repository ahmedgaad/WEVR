
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/managers/assets_manager.dart';
import '../../../shared/managers/values_manager.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            ImagesAssetsManager.googleIc,
          ),
        ),
        SizedBox(
          width: AppSize.s20.w,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            ImagesAssetsManager.appleIc,
          ),
        ),
        SizedBox(
          width: AppSize.s20.w,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            ImagesAssetsManager.facebookLogoIc,
          ),
        ),
      ],
    );
  }
}