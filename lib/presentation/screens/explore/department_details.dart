import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/presentation/screens/explore/virtual_tour.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/values_manager.dart';
import 'phot_gallery.dart';

class DepartmentDetails extends StatelessWidget {
  const DepartmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  ImagesAssetsManager.apartment2,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    //TODO handling statusbar
                    horizontal: 10.0,
                    vertical: 30.0,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: 120,
                  left: 20,
                  child: blurButton(
                    context,
                    text: 'Virtual Tour',
                    widget: const VirtualTour(),

                  ),
              ),
              Positioned(
                top: 120,
                right: 20,
                child: blurButton(
                  context,
                  text: 'photo gallery',
                    widget:  const PhotGallery(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget blurButton(context , {
  required String text,
  required Widget widget,
}) {
  return GestureDetector(
    onTap: (){
      navigatePush(context, widget);
    },
    child: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
            width: AppSize.s162,
            height: AppSize.s50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.white.withOpacity(0.4),
            ),
          child: Center(
            child: Text(
              text,
              style: getMediumStylePoppins(
                color: ColorManager.black,
              fontSize: AppSize.s20.sp,
            ),),
          ),
        ),
      ),
    ),
  );
}
