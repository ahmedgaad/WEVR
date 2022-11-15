// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/modules/get_started/get_started_view.dart';
import 'package:wevr_app/modules/profile/profile_view.dart';
import 'package:wevr_app/shared/components/components.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:wevr_app/shared/managers/values_manager.dart';
import '../../shared/managers/assets_manager.dart';
import '../../shared/managers/color_manager.dart';

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
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    navigatePush(context, ProfileView());
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorManager.primary,
                    radius: AppSize.s25.sp,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    navigatePush(context, GetStartedView());
                  },
                  icon: SvgPicture.asset(
                    ImagesAssetsManager.signOut,
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSize.s27.h,
            ),
            Row(
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
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: AppSize.s10.w,
                  ),
                  child: Container(
                    width: AppSize.s40.w,
                    height: AppSize.s41.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppRadius.r10)),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(ImagesAssetsManager.filters)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSize.s27.h,
            ),
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorManager.primary),
                )
              ],
              options: CarouselOptions(
                height: AppSize.s184.h,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
              ),
            ),
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
            Row(
              children: [
                Text(
                  AppStrings.allHomes,
                  style: getRegularStylePoppins(
                      color: ColorManager.black,
                      fontSize: AppSize.s16.sp
                  ),
                ),
                Spacer(),
                Container(
                  width: AppSize.s66.w,
                  height: AppSize.s36.h,
                  decoration: BoxDecoration(
                    color: ColorManager.orBackground,
                    borderRadius: BorderRadius.circular(AppRadius.r20)
                  ),
                  child: IconButton(
                      onPressed: (){},
                      icon: Text(
                        AppStrings.viewAll,
                      )
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSize.s15.h,
            ),
            Container(
              width: AppSize.s300.w,
              height: AppSize.s300.h,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
