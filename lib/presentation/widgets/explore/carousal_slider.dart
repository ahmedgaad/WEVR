import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/assets_manager.dart';
import '../../../core/utils/values_manager.dart';

class CarousalSlider extends StatelessWidget {
  const CarousalSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r10),
              ),
          child: Image.asset(ImagesAssetsManager.slider),
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
    );
  }
}
