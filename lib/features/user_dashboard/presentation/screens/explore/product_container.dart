import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../controller/Home/cubit.dart';
import '../../controller/Home/states.dart';
import '../../widgets/explore/fav_icon.dart';
import 'department_details.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayOutStates>(
        builder: (context, state) {
      if (state is ApartmentLoadingState) {
        return const Center(
            child: CircularProgressIndicator(
          color: ColorManager.primary,
        ));
      }
      if (state is ApartmentLoadedState) {
        if (state.apartment.apartments.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "data not found , please try again",
              style: getRegularStylePoppins(fontSize: 14.0),
            ),
          );
        } else {
          return SizedBox(
            height: 300.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
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
                                state.apartment.apartments[index].type,
                                style: getMediumStylePoppins(
                                  color: ColorManager.lightPink,
                                  fontSize: AppSize.s16,
                                ),
                              ),
                              const Spacer(),
                              FavIcon(id: state.apartment.apartments[index].id,),
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
                                state.apartment.apartments[index].location,
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
                                state.apartment.apartments[index].info.monthprice,
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
                    width: 20,
                  ),
              itemCount: state.apartment.apartments.length,
            ),
          );
        }
      }
      if (state is ApartmentErrorState) {
        print(state.error);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Not found , please try again",
                  style: getRegularStylePoppins(fontSize: 14.0),
                ),
                IconButton(
                    onPressed: () {
                      HomeLayoutCubit.get(context).getApartment();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: ColorManager.primary,
                    ))
              ],
            ),
          ),
        );
      }
      return Container();
    });
  }
}

Widget icon({
  required IconData icon,
}) {
  return Icon(
    icon,
    color: ColorManager.darkGrey,
    size: AppSize.s30,
  );
}

Widget spaceH() {
  return SizedBox(
    height: AppSize.s10.h,
  );
}

Widget spaceW() {
  return SizedBox(
    width: AppSize.s10.w,
  );
}

Widget favIcon({
  double? iconsSize,
}) {
  return Icon(
    Icons.favorite,
    size: iconsSize,
    color: Colors.redAccent,
  );
}
