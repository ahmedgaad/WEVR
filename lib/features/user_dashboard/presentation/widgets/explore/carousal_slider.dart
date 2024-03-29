import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class CarousalSlider extends StatelessWidget {
  const CarousalSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: CarouselSlider(
        items: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(AssetsImagesManager.slider),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r10),
                    gradient: const LinearGradient(
                      colors: [
                        ColorManager.black,
                        ColorManager.transparent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: AppSize.s150.w,
                  child: Text(
                    'Find your apartment ',
                    style: getBoldStylePoppins(
                      color: ColorManager.white,
                      fontSize: AppSize.s20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        options: CarouselOptions(
          height: AppSize.s184.h,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}
