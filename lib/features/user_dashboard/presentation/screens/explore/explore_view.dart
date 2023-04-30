// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';
import '../../widgets/explore/carousal_slider.dart';
import '../../widgets/explore/profile_row.dart';
import '../../widgets/search/filter_widget.dart';
import '../search/search_view.dart';
import 'product_container.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfileRow(),
            27.ph,
            GestureDetector(
              onTap: () {
                navigatePush(context, SearchView());
              },
              child: searchBar(),
            ),
            27.ph,
            CarousalSlider(),
            15.ph,
            Container(
              height: AppSize.s1.h,
              width: AppSize.s300.w,
              color: ColorManager.lightGrey,
            ),
            15.ph,
            allHomesRow(),
            15.ph,
            SizedBox(
                height: 300.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      listViewBuilder(),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                        width: 20,
                      ),
                  itemCount: 10,
                )),
          ],
        ),
      ),
    );

        }


  }


Widget listViewBuilder() {
  return Container(
    width: AppSize.s250.w,
    height: AppSize.s320.h,
    decoration: BoxDecoration(
      color: ColorManager.white,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: SizedBox(height: 250.h, child: ProductContainer()),
  );
}

Widget searchBar() {
  return Row(
    children: [
      Container(
        width: AppSize.s255.w,
        height: AppSize.s50.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6.0,
            )
          ],
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r10)),
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
            Text(
              StringsManager.searchBar.tr(),
              style: getRegularStyleInter(
                color: ColorManager.smokyGray,
                fontSize: AppSize.s16,
              ),
            ),
          ],
        ),
      ),
      Spacer(),
      FilterWidget(),
    ],
  );
}

Widget allHomesRow() {
  return Row(
    children: [
      Text(
        StringsManager.allHomes.tr(),
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
                StringsManager.viewAll.tr(),
              )),
        ),
      )
    ],
  );
}
