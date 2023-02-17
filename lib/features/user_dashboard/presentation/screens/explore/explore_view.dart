// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import '../../widgets/explore/carousal_slider.dart';
import '../../widgets/explore/profile_row.dart';
import '../search/search_view.dart';
import 'department_details.dart';
import 'product_container.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileRow(),
            SizedBox(
              height: AppSize.s27.h,
            ),
            GestureDetector(
              onTap: (){
                navigatePush(context, SearchView());
              },
              child: searchBar(),
            ),
            SizedBox(
              height: AppSize.s27.h,
            ),
            CarousalSlider(),
            SizedBox(
              height: AppSize.s15.h,
            ),
            Container(
              height: AppSize.s1.h,
              width: AppSize.s300.w,
              color: ColorManager.lightGrey,
            ),
            SizedBox(
              height: AppSize.s15.h,
            ),
            allHomesRow(),
            SizedBox(
              height: AppSize.s15.h,
            ),
            Container(
              width: AppSize.s250.w,
              height: AppSize.s320.h,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: GestureDetector(
                onTap:(){
                  navigatePush(context, DepartmentDetails());
                } ,
                  child: ProductContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget searchBar(){
  return Row(
    children: [
      Container(
        width: AppSize.s255.w,
        height: AppSize.s41.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius:
          BorderRadius.all(Radius.circular(AppRadius.r10)),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: ColorManager.black,
                )),
            SizedBox(
              width: AppSize.s10.w,
            ),
            Text( AppStrings.searchBar.tr() , style: getRegularStyleInter(
              color: ColorManager.smokyGray,
              fontSize: AppSize.s16,
            ),),
          ],
        ),
      ),
      Spacer(),
      filterWidget(),
    ],
  );
}

Widget allHomesRow(){
  return Row(
    children: [
      Text(
        AppStrings.allHomes.tr(),
        style: getRegularStylePoppins(
            color: ColorManager.black, fontSize: AppSize.s16.sp),
      ),
      Spacer(),
      Container(
        width: AppSize.s66.w,
        height: AppSize.s36.h,
        decoration: BoxDecoration(
            color: ColorManager.orBackground,
            borderRadius: BorderRadius.circular(AppRadius.r20)),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
              onPressed: () {},
              icon: Text(
                AppStrings.viewAll.tr(),
              )),
        ),
      )
    ],
  );
}
