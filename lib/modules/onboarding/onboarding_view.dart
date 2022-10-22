import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wevr_app/shared/managers/assets_manager.dart';
import 'package:wevr_app/shared/managers/font_manager.dart';
import 'package:wevr_app/shared/managers/routes_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/components/constants.dart';
import '../../shared/managers/color_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../shared/managers/values_manager.dart';

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
        ImagesAssetsManager.onBoarding1,
        AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1,
    ),
    SliderObject(
      ImagesAssetsManager.onBoarding2,
      AppStrings.onBoardingTitle2,
      AppStrings.onBoardingSubTitle2,
    ),
    SliderObject(
      ImagesAssetsManager.onBoarding3,
      AppStrings.onBoardingTitle3,
      AppStrings.onBoardingSubTitle3,
    ),
    SliderObject(
      ImagesAssetsManager.onBoarding4,
      AppStrings.onBoardingTitle4,
      AppStrings.onBoardingSubTitle4,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        /*systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
         */
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, Routes.getStarted);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: PaddingSize.p20
                ),
                child: Text(
                  AppStrings.skip,
                  style: getRegularStyleInter(
                      color: ColorManager.black,
                      fontSize: FontSize.s20
                  ),
                ),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s4),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                  itemCount: _list.length,
                  onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                  if(index == _list.length -1){
                    setState(() {
                      isLast = true;
                    });
                  }else{
                    setState(() {
                      isLast = false;
                    });
                  }
                  },
                  itemBuilder: (context, index) => itemSlider(_list[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: AppSize.s12
              ),
              child: SmoothPageIndicator(
                  controller: _pageController,
                  effect: const ExpandingDotsEffect(
                    dotColor: ColorManager.lightPrimary,
                    activeDotColor: ColorManager.primary,
                    dotHeight: AppSize.s7,
                    dotWidth: AppSize.s10,
                    expansionFactor: AppSize.s5,
                    spacing: AppSize.s6,

                  ),
                  count: _list.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(PaddingSize.p8),
              child: Row(
                children: [
                  ConditionalBuilder(
                    condition: currentIndex > 0,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(PaddingSize.p40),
                        child: GestureDetector(
                          onTap: (){
                            _pageController.previousPage(
                              duration: const Duration(
                                  seconds: AppConstants.previousPageTime
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                          child: Container(
                            height: AppSize.s44,
                            width: AppSize.s44,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorManager.lightGrey,
                                  width: AppSize.s4,
                                )
                            ),
                            child: SvgPicture.asset(ImagesAssetsManager.leftArrowIc,
                              color: ColorManager.lightGrey,
                              fit: BoxFit.scaleDown,
                              height: AppSize.s25_33,
                              width: AppSize.s14_67,
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
                    padding: const EdgeInsets.all(PaddingSize.p40),
                    child: GestureDetector(
                      onTap: (){
                        if(isLast){
                          Navigator.pushReplacementNamed(context, Routes.getStarted);
                        }
                        _pageController.nextPage(
                            duration: const Duration(
                              seconds: AppConstants.nextPageTime,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: Container(
                        height: AppSize.s44,
                        width: AppSize.s44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.primary,
                            width: AppSize.s4,
                          ),
                        ),
                        child: SvgPicture.asset(ImagesAssetsManager.rightArrowIc,
                          fit: BoxFit.scaleDown,
                          height: AppSize.s25_33,
                          width: AppSize.s14_67,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppMargin.m24,
            ),
          ],
        ),
      ),
    );
  }











  Widget itemSlider(SliderObject object) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(
        height: AppSize.s36,
      ),
      SvgPicture.asset(
          object.image,
        height: AppSize.s300,
        width: AppSize.s281_25,
        fit: BoxFit.scaleDown,
      ),
      const SizedBox(
        height: AppSize.s24,
      ),
      Text(
        object.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const SizedBox(
        height: AppSize.s10,
      ),
      Padding(
        padding: const EdgeInsets.all(PaddingSize.p8),
        child: Text(
          object.subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ],
  );
}





class SliderObject{
  String image;
  String title;
  String subTitle;

  SliderObject(
      this.image,
      this.title,
      this.subTitle,
      );
}
