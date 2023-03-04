import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppMargin.m6.sp),
      child: ListTile(
        leading: SvgPicture.asset(icon),
        title: Text(
          label,
          style: getRegularStylePoppins(
            color: ColorManager.smokyGray,
            fontSize: FontSize.s20.sp,
          ),
        ),
        trailing: SvgPicture.asset(
          AssetsImagesManager.rightArrowIc,
          fit: BoxFit.scaleDown,
          width: AppSize.s18.w,
          height: AppSize.s18.h,
        ),
        onTap: onTap,
      ),
    );
  }
}
