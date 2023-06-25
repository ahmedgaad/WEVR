import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';
import 'package:wevr_app/features/user_dashboard/presentation/screens/booking/book_visit_view.dart';
import 'package:wevr_app/features/user_dashboard/presentation/widgets/explore/rating_bar.dart';
import '../../../../../core/components/bottom_sheet.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../map_based_homes/presentation/screens/google_map.dart';
import '../../../../user_profile/presentation/widgets/profile/build_divider.dart';
import '../../controller/Home/cubit.dart';
import '../../widgets/apartment/stack_vr_gallery.dart';
import '../../widgets/explore/links_button.dart';
import '../../widgets/explore/read_more_text.dart';
import 'product_container.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../widgets/explore/container_button.dart';

class DepartmentDetails extends StatefulWidget {
  const DepartmentDetails({super.key});

  @override
  State<DepartmentDetails> createState() => _DepartmentDetailsState();
}

class _DepartmentDetailsState extends State<DepartmentDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayOutStates>(
      builder: (context, state) {
        if (state is ApartmentLoadedState) {
          return Scaffold(
            backgroundColor: ColorManager.exploreBackground,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const StackVr(),
                        spaceH(),
                        Padding(
                          padding: const EdgeInsets.all(PaddingSize.p20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ContainerButton(),
                              dividerColumn(),
                              Row(
                                children: [
                                  icon(
                                    icon: Icons.location_on_outlined,
                                  ),
                                  spaceW(),
                                  Text(
                                    state.apartment.apartments[0].location,
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
                                  roomsDetails(
                                      image: AssetsImagesManager.livingRooms,
                                      number: state.apartment.apartments[0].info
                                          .livingroom,
                                      roomName: 'Living Rooms'),
                                  spaceW(),
                                  roomsDetails(
                                      image: AssetsImagesManager.bedrooms,
                                      number: state
                                          .apartment.apartments[0].info.bedroom,
                                      roomName: 'Bed Rooms'),
                                ],
                              ),
                              15.ph,
                              Row(
                                children: [
                                  roomsDetails(
                                      image: AssetsImagesManager.parking,
                                      number: state
                                          .apartment.apartments[0].info.parking,
                                      roomName: 'Parking'),
                                  spaceW(),
                                  roomsDetails(
                                      image: AssetsImagesManager.bathrooms,
                                      number: state
                                          .apartment.apartments[0].info.baths,
                                      roomName: 'Baths'),
                                ],
                              ),
                              15.ph,
                              Row(
                                children: [
                                  roomsDetails(
                                      image: AssetsImagesManager.floors,
                                      number: state
                                          .apartment.apartments[0].info.floors,
                                      roomName: 'Floors'),
                                  spaceW(),
                                  roomsDetails(
                                    image: AssetsImagesManager.squareMeter,
                                    number:
                                        state.apartment.apartments[0].info.erea,
                                    roomName: '100m2',
                                  ),
                                ],
                              ),
                              // 15.ph,
                              dividerColumn(),
                              Row(
                                children: [
                                  Text(
                                    'Excellent',
                                    style: getRegularStylePoppins(
                                        fontSize: AppSize.s16),
                                  ),
                                  const Spacer(),
                                  const RatingBarWidget(),
                                ],
                              ),
                              dividerColumn(),
                              Text(
                                'About this apartment',
                                style: getMediumStylePoppins(
                                  fontSize: 16.0,
                                  color: ColorManager.darkGrey,
                                ),
                              ),
                              15.ph,
                              ReadMoreText(
                                text: state.apartment.apartments[0].descrption,
                              ),
                              dividerColumn(),
                              Text(
                                'features & aminies',
                                style: getMediumStylePoppins(
                                  fontSize: 16.0,
                                  color: ColorManager.darkGrey,
                                ),
                              ),
                              15.ph,
                              SizedBox(
                                  width: 500.0,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: state.apartment.apartments[0]
                                        .features.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          color: Colors.black,
                                          size: 8,
                                        ),
                                        10.pw,
                                        Expanded(
                                          child: Text(
                                            state.apartment.apartments[0]
                                                .features[0],
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Container(
                                      height: 20,
                                    ),
                                  )),
                              25.ph,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.ph,
                Container(
                  color: ColorManager.white,
                  width: double.infinity,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: LinksButton(
                          icon: const Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 15,
                          ),
                          function: () {},
                          text: 'Email',
                          background: Colors.grey,
                        )),
                        10.pw,
                        Expanded(
                            child: LinksButton(
                          icon: Image.asset(
                            AssetsImagesManager.whatsapp,
                            width: 20,
                          ),
                          function: () {},
                          text: 'WhatsApp',
                          background: Colors.grey,
                        )),
                        10.pw,
                        Expanded(
                            child: LinksButton(
                          icon: Image.asset(
                            AssetsImagesManager.bookVisit,
                            width: 20,
                          ),
                          function: () {
                            if (Constants.userToken == null) {
                              showBottomSheetWidget(context);
                            } else {
                              navigatePush(context, const BookVisitView());
                            }
                          },
                          text: 'book visit',
                          background: ColorManager.primary,
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return const Scaffold();
      },
    );
  }
}

// reusable Widgets

Widget mapContainer(context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lightGrey),
        borderRadius: BorderRadius.circular(AppSize.s50)),
    child: FloatingActionButton(
      elevation: AppSize.s0,
      onPressed: () {
        navigatePush(context, const MapView());
      },
      backgroundColor: ColorManager.white,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: SvgPicture.asset(AssetsImagesManager.map),
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
}) {
  return Expanded(
    child: Container(
      height: AppSize.s40,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.borderColor),
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Row(
        children: [
          spaceW(),
          SvgPicture.asset(image),
          spaceW(),
          Text(
            number,
          ),
          const Spacer(),
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
