import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/components/bottom_sheet.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../map_based_homes/presentation/screens/google_map.dart';
import '../auction/auction_imports.dart';
import '../explore/explore_view.dart';
import '../homes/homes_view.dart';
import '../saved/saved_view.dart';
import '../../controller/Home/cubit.dart';
import '../../controller/Home/states.dart';

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
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    return BlocConsumer<HomeLayoutCubit, HomeLayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.exploreBackground,
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
            height: AppSize.s75.h,
            width: AppSize.s75.w,
            child: FloatingActionButton(
              onPressed: () {
                navigatePush(context, const MapView());
              },
              backgroundColor: ColorManager.white,
              child: SvgPicture.asset(AssetsImagesManager.map),
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
                            cubit.getApartment();
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsImagesManager.explore,
                              // ignore: deprecated_member_use
                              color: cubit.currentTap == 0
                                  ? ColorManager.primary
                                  : ColorManager.darkGrey,
                            ),
                            SizedBox(
                              height: AppSize.s2.h,
                            ),
                            Text(
                              StringsManager.explore.tr,
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
                            if (Constants.userToken == null) {
                              showBottomSheetWidget(context);
                            } else {
                              cubit.currentScreen = const SavedView();
                              cubit.currentTap = 1;
                              cubit.getSavedApartments();
                            }
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
                              StringsManager.saved.tr,
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
                            if (Constants.userToken == null) {
                              showBottomSheetWidget(context);
                            } else{
                              cubit.currentScreen = const HomesView();
                              cubit.currentTap = 3;
                            }

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
                              StringsManager.homes.tr,
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
                            if (Constants.userToken == null) {
                              showBottomSheetWidget(context);
                            } else {
                              cubit.currentScreen = const AuctionView();
                              cubit.currentTap = 4;
                            }
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsImagesManager.auction,
                              color: cubit.currentTap == 4
                                  ? ColorManager.primary
                                  : ColorManager.darkGrey,
                            ),
                            SizedBox(
                              height: AppSize.s2.h,
                            ),
                            Text(
                              StringsManager.auction.tr,
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
        );
      },
    );
  }
}
