
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorManager.lightGrey,
      thickness: 1,
      indent: AppSize.s16.h,
      endIndent: AppSize.s24.h,
    );
  }
}
