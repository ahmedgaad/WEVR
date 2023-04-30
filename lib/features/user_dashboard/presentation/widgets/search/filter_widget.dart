import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/features/user_dashboard/presentation/screens/explore/filters.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: AppSize.s10.w,
      ),
      child: Container(
        width: AppSize.s40.w,
        height: AppSize.s50.h,
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              // offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            )
          ],
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)),
        ),
        child: IconButton(
            onPressed: () {
              navigatePush(context, const FiltersView());
            },
            icon: SvgPicture.asset(AssetsImagesManager.filters)),
      ),
    );
  }
}
