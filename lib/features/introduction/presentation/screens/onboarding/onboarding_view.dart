import 'dart:math' as math;

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wevr_app/features/introduction/presentation/components/item_slider.dart';
import '../../../../../core/localization/change_locale.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/config/routes/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  late final List<SliderObject> _list = _getSliderData();
  int currentIndex = 0;
  bool isLast = false;

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AssetsImagesManager.onBoarding1,
          StringsManager.onBoardingTitle1.tr,
          StringsManager.onBoardingSubTitle1.tr,
        ),
        SliderObject(
          AssetsImagesManager.onBoarding2,
          StringsManager.onBoardingTitle2.tr,
          StringsManager.onBoardingSubTitle2.tr,
        ),
        SliderObject(
          AssetsImagesManager.onBoarding3,
          StringsManager.onBoardingTitle3.tr,
          StringsManager.onBoardingSubTitle3.tr,
        ),
        SliderObject(
          AssetsImagesManager.onBoarding4,
          StringsManager.onBoardingTitle4.tr,
          StringsManager.onBoardingSubTitle4.tr,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.getStartedRoute);
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: PaddingSize.p20.w),
              child: Text(
                StringsManager.skip.tr,
                style: getRegularStyleInter(
                    color: ColorManager.black, fontSize: FontSize.s20.sp),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.s6.w),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: _list.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                  if (index == _list.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    ItemSlider(object: _list[index]),
              ),
            ),
            AppSize.s50.h.ph,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.s24.h,
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      effect: ExpandingDotsEffect(
                        dotColor: ColorManager.lightPrimary,
                        activeDotColor: ColorManager.primary,
                        dotHeight: AppSize.s7.h,
                        dotWidth: AppSize.s24.w,
                        expansionFactor: AppSize.s2.w,
                        spacing: AppSize.s6.w,
                      ),
                      count: _list.length,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: PaddingSize.p40.h),
                      child: Row(
                        children: [
                          ConditionalBuilder(
                            condition: currentIndex > 0,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.s40.w,
                                  vertical: AppSize.s40.h,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _pageController.previousPage(
                                      duration: const Duration(
                                          seconds: Constants.previousPageTime),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                    );
                                  },
                                  child: Container(
                                    height: AppSize.s44.h,
                                    width: AppSize.s44.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ColorManager.lightGrey,
                                          width: AppSize.s4,
                                        )),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.s6.w,
                                        vertical: AppSize.s6.h,
                                      ),
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(localeController.language?.languageCode == "ar" ? math.pi : 0),
                                        child: SvgPicture.asset(
                                          AssetsImagesManager.leftArrowIc,
                                          color: ColorManager.lightGrey,
                                          fit: BoxFit.scaleDown,
                                          height: AppSize.s25_33.h,
                                          width: AppSize.s14_67.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            fallback: (BuildContext context) {
                              return Container();
                            },
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.s40.w,
                              vertical: AppSize.s40.h,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (isLast) {
                                  Navigator.pushReplacementNamed(context, Routes.getStartedRoute);
                                }
                                _pageController.nextPage(
                                  duration: const Duration(
                                    seconds: Constants.nextPageTime,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                              child: Container(
                                height: AppSize.s44.h,
                                width: AppSize.s44.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ColorManager.primary,
                                    width: AppSize.s4,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.s6.w,
                                    vertical: AppSize.s6.h,
                                  ),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(localeController.language?.languageCode == "ar" ? math.pi : 0),
                                    child: SvgPicture.asset(
                                      AssetsImagesManager.rightArrowIc,
                                      fit: BoxFit.scaleDown,
                                      height: AppSize.s25_33.h,
                                      width: AppSize.s14_67.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderObject {
  String image;
  String title;
  String subTitle;

  SliderObject(
    this.image,
    this.title,
    this.subTitle,
  );
}
