import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/components/empty_data_column.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../widgets/explore/fav_icon.dart';
import '../../widgets/saved/home_auction_button.dart';
import '../explore/department_details.dart';
import '../explore/product_container.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: BlocBuilder<HomeLayoutCubit, HomeLayOutStates>(
        builder: (context, state) {
          if (state is SavedApartmentsLoadingStates) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            );
          }
          if (state is SavedApartmentsSuccessLoadedStates) {
            if (state.savedApartments.apartments.isEmpty) {
              return const EmptyDataColumn();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: HomeAuctionButton(),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 300.w,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                              width: AppSize.s255.w,
                              height: AppSize.s360.h,
                              decoration: const BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          navigatePush(context, const DepartmentDetails());
                                        },
                                        child: Image.asset(
                                          AssetsImagesManager.apartment,
                                        ),
                                      ),
                                    ),
                                    spaceH(),
                                    Row(
                                      children: [
                                        icon(
                                          icon: Icons.house_outlined,
                                        ),
                                        spaceW(),
                                        Text(
                                          state.savedApartments.apartments[index].type,
                                          style: getMediumStylePoppins(
                                            color: ColorManager.lightPink,
                                            fontSize: AppSize.s16,
                                          ),
                                        ),
                                        const Spacer(),
                                        FavIcon(id: state.savedApartments.apartments[index].id,),
                                      ],
                                    ),
                                    spaceH(),
                                    Row(
                                      children: [
                                        icon(
                                          icon: Icons.location_on_outlined,
                                        ),
                                        spaceW(),
                                        Text(
                                          state.savedApartments.apartments[index].location,
                                          style: getMediumStylePoppins(
                                            color: ColorManager.smokyGray,
                                            fontSize: AppSize.s16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    spaceH(),
                                    Row(
                                      children: [
                                        moneyIcon(),
                                        spaceW(),
                                        Text(
                                          state.savedApartments.apartments[index].info.monthprice,
                                          style: getSemiBoldStylePoppins(
                                            color: ColorManager.primary,
                                            fontSize: AppSize.s16,
                                          ),
                                        ),
                                        Text('/month'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                              height: 20,
                            ),
                        itemCount: state.savedApartments.apartments.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: defaultButton(
                      function: () {},
                      text: 'Continue Exploring',
                      width: 280.w,
                      height: 48.h,
                    ),
                  ),
                ],
              );
            }
          }
          if (state is SavedApartmentsErrorLoadedStates) {
            print(state.error);
          }
          return Container();
        },
      ),
    );
  }
}
