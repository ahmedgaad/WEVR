import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/core/components/components.dart';
import '../../../core/managers/assets_manager.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/managers/font_manager.dart';
import '../../../core/managers/strings_manager.dart';
import '../../../core/managers/style_manager.dart';
import '../../../core/managers/values_manager.dart';
import '../auction/auction_view.dart';
import '../explore/explore_view.dart';
import '../homes/homes_view.dart';
import '../map/google_map.dart';
import '../saved/saved_view.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return BlocProvider(
      create: (BuildContext context) => HomeLayOutCubit(),
      child: BlocConsumer<HomeLayOutCubit, HomeLayOutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayOutCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.exploreBackground,
            // appBar: AppBar(
            //   backgroundColor: ColorManager.exploreBackground,
            //   elevation: AppSize.s0,
            // ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(PaddingSize.p20.sp),
                child: PageStorage(
                  bucket: cubit.bucket,
                  child: cubit.currentScreen,
                ),
              ),
            ),
            floatingActionButton: SizedBox(
              height: AppSize.s80.h,
              width: AppSize.s80.w,
              child: FloatingActionButton(
                onPressed: () {
                  navigatePush(context, const Map());
                },
                backgroundColor: ColorManager.white,
                child: SvgPicture.asset(ImagesAssetsManager.map),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: AppSize.s10.sp,
              child: SizedBox(
                height: AppSize.s83.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              cubit.currentScreen = const ExploreView();
                              cubit.currentTap = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagesAssetsManager.explore,
                                color: cubit.currentTap == 0
                                    ? ColorManager.primary
                                    : ColorManager.darkGrey,
                              ),
                              SizedBox(
                                height: AppSize.s2.h,
                              ),
                              Text(
                                AppStrings.explore,
                                style: getRegularStylePoppins(
                                  color: cubit.currentTap == 0
                                      ? ColorManager.primary
                                      : ColorManager.darkGrey,
                                  fontSize: FontSize.s12,
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              cubit.currentScreen = const SavedView();
                              cubit.currentTap = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: cubit.currentTap == 1
                                    ? ColorManager.primary
                                    : ColorManager.darkGrey,
                              ),
                              Text(
                                AppStrings.saved,
                                style: getRegularStylePoppins(
                                  color: cubit.currentTap == 1
                                      ? ColorManager.primary
                                      : ColorManager.darkGrey,
                                  fontSize: FontSize.s12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              cubit.currentScreen = const HomesView();
                              cubit.currentTap = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.house,
                                color: cubit.currentTap == 3
                                    ? ColorManager.primary
                                    : ColorManager.darkGrey,
                              ),
                              Text(
                                AppStrings.homes,
                                style: getRegularStylePoppins(
                                  color: cubit.currentTap == 3
                                      ? ColorManager.primary
                                      : ColorManager.darkGrey,
                                  fontSize: FontSize.s12,
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              cubit.currentScreen = const AuctionView();
                              cubit.currentTap = 4;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagesAssetsManager.auction,
                                color: cubit.currentTap == 4
                                    ? ColorManager.primary
                                    : ColorManager.darkGrey,
                              ),
                              SizedBox(
                                height: AppSize.s2.h,
                              ),
                              Text(
                                AppStrings.auction,
                                style: getRegularStylePoppins(
                                  color: cubit.currentTap == 4
                                      ? ColorManager.primary
                                      : ColorManager.darkGrey,
                                  fontSize: FontSize.s12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   type: BottomNavigationBarType.fixed,
            //   currentIndex: cubit.currentIndex,
            //   selectedItemColor: ColorManager.primary,
            //   onTap: (index){
            //     cubit.changeBottom(index);
            //   },
            //   items:  [
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.explore),
            //         label: 'Eplore'
            //     ),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.bookmark),
            //         label: 'Saved'
            //     ),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.other_houses_sharp),
            //         label: 'Homes'
            //
            //     ),
            //     BottomNavigationBarItem(
            //       label: 'Auction',
            //       icon: Icon(Icons.h_mobiledata),
            //     ),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
