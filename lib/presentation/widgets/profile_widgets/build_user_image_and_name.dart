
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/fonts_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../../../core/utils/values_manager.dart';

class BuildUserImageAndName extends StatelessWidget {
  const BuildUserImageAndName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppSize.s144.h,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.primary,
            radius: AppSize.s44.sp,
            child: Image.asset(
              ImagesAssetsManager.userPic,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          Text(
            'user1',
            style: getMediumStylePoppins(
              color: ColorManager.black,
              fontSize: FontSize.s20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
