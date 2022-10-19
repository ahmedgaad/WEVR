import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wevr_app/presentation/resources/assets_manager.dart';
import 'package:wevr_app/presentation/resources/font_manager.dart';
import 'package:wevr_app/presentation/resources/strings_manager.dart';
import 'package:wevr_app/presentation/resources/style_manager.dart';
import 'package:wevr_app/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  late final List<SliderObject> _list = _getSliderData();
  int currentIndex = 0;
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
              onPressed: (){},
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: AppPadding.p20
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
        padding: const EdgeInsets.all(AppSize.s0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                  itemCount: _list.length,
                  onPageChanged: (int index){
                  currentIndex = index;
                  },
                  itemBuilder: (context, index) => itemSlider(_list[index]),
              ),
            ),
            SmoothPageIndicator(
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
            const SizedBox(
              height: AppSize.s255
            )
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
        padding: const EdgeInsets.all(AppPadding.p8),
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
