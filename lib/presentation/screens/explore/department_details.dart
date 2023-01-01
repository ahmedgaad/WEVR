import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/presentation/screens/explore/product_container.dart';
import 'package:wevr_app/presentation/screens/explore/virtual_tour.dart';
import '../map/google_map.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/values_manager.dart';
import '../../widgets/explore/container_button.dart';
import '../../widgets/profile_widgets/build_divider.dart';
import 'phot_gallery.dart';

class DepartmentDetails extends StatefulWidget {
  const DepartmentDetails({super.key});

  @override
  State<DepartmentDetails> createState() => _DepartmentDetailsState();
}

class _DepartmentDetailsState extends State<DepartmentDetails> {
  // const DepartmentDetails({Key? key}) : super(key: key);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
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
                  widget: const PhotGallery(),
                ),
              ),
            ],
          ),
          spaceH(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(PaddingSize.p20),
              child: Column(
                children: [
                  Row(
                    children: [
                      moneyIcon(),
                      spaceW(),
                      Text(
                        '2000EGP',
                        style: getSemiBoldStylePoppins(
                          color: ColorManager.primary,
                          fontSize: AppSize.s18,
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      const ContainerButton(),
                    ],
                  ),
                  dividerColumn(),
                  Row(
                    children: [
                      icon(
                        icon: Icons.location_on_outlined,
                      ),
                      spaceW(),
                      Text(
                        'Cairo',
                        style: getMediumStylePoppins(
                          color: ColorManager.smokyGray,
                          fontSize: AppSize.s16,
                        ),
                      ),
                      const Spacer(),
                      mapContainer(context),
                    ],
                  ),
                  dividerColumn(),
                  Row(
                    children: [
                      roomsDetails(image: ImagesAssetsManager.livingRooms, number: '2', roomName: 'Living Rooms'),
                      spaceW(),
                      roomsDetails(image: ImagesAssetsManager.bedrooms, number: '4', roomName: 'Bed Rooms'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      roomsDetails(image: ImagesAssetsManager.parking, number: '1', roomName: 'Parking'),
                      spaceW(),
                      roomsDetails(image: ImagesAssetsManager.bathrooms, number: '3', roomName: 'Baths'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      roomsDetails(image: ImagesAssetsManager.floors, number: '2', roomName: 'Floors'),
                      spaceW(),
                      roomsDetails(image: ImagesAssetsManager.squareMeter,number: '', roomName: '100m2'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// reusable Widgets
Widget blurButton(
  context, {
  required String text,
  required Widget widget,
}) {
  return GestureDetector(
    onTap: () {
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
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget mapContainer(context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lightGrey),
        borderRadius: BorderRadius.circular(AppSize.s50)),
    child: FloatingActionButton(
      elevation: AppSize.s0,
      onPressed: () {
        navigatePush(context, const Map());
      },
      backgroundColor: ColorManager.white,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: SvgPicture.asset(ImagesAssetsManager.map),
      ),
    ),
  );
}

Widget dividerColumn() {
  return Column(
    children: const [
      SizedBox(
        height: AppSize.s20,
      ),
      BuildDivider(),
      SizedBox(
        height: AppSize.s20,
      ),
    ],
  );
}

Widget roomsDetails({
  required String image,
  required String number,
  required String roomName,
}){
  return Expanded(
    child: Container(
      height: AppSize.s40,
      decoration: BoxDecoration(
          border:
          Border.all(color: ColorManager.borderColor),
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Row(
        children: [
          spaceW(),
          SvgPicture.asset(image),
          spaceW(),
          Text(
            number,
          ),
          Spacer(),
          Text(
            roomName,
            style: getLightStyleInter(
                color: ColorManager.smokyGray,
              fontSize: 14,
            ),
          ),
          spaceW(),
        ],
      ),
    ),
  );
}
