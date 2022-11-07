import 'package:flutter/material.dart';
import 'package:wevr_app/modules/auction/auction_view.dart';
import 'package:wevr_app/modules/explore/explore_view.dart';
import 'package:wevr_app/modules/home/cubit/cubit.dart';
import 'package:wevr_app/modules/home/cubit/states.dart';
import 'package:wevr_app/modules/homes/homes_view.dart';
import 'package:wevr_app/modules/saved/saved_view.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/shared/managers/font_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import '../../shared/managers/values_manager.dart';
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
    return BlocProvider(
      create: (BuildContext context) => HomeLayOutCubit(),
      child: BlocConsumer<HomeLayOutCubit, HomeLayOutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayOutCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.exploreBackground,
            appBar: AppBar(
              backgroundColor: ColorManager.exploreBackground,
              elevation: AppSize.s0,
            ),
            body: PageStorage(
              child: cubit.currentScreen,
              bucket: cubit.bucket,
            ),
            floatingActionButton: Container(
              height: AppSize.s80.h,
              width: AppSize.s80.w,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: ColorManager.white,
                child: SvgPicture.asset(ImagesAssetsManager.map),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: AppSize.s10.sp,
              child: Container(
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
                              cubit.currentScreen = ExploreView();
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
                              cubit.currentScreen = SavedView();
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
                              cubit.currentScreen = HomesView();
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
                              cubit.currentScreen = AuctionView();
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
