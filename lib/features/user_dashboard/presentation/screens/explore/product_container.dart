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
        builder: (context, state)
    {
      if (state is ProductLoadingState) {
        return const Center(child: CircularProgressIndicator(color: ColorManager.primary, ));
      }
      if (state is ProductLoadedState) {
        return Padding(
            padding: const EdgeInsets.all(PaddingSize.p20),
            child: SizedBox(
              height: 250.h,
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
                        state.products[0].type,
                        style: getMediumStylePoppins(
                          color: ColorManager.lightPink,
                          fontSize: AppSize.s16,
                        ),
                      ),
                      const Spacer(),
                      const FavIcon(),
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
                        state.products[0].location,
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
                        state.products[0].monthPrice,
                        style: getSemiBoldStylePoppins(
                          color: ColorManager.primary,
                          fontSize: AppSize.s16,
                        ),
                      ),
                      Text('/month'),
                    ],
                  ),
                ],
              ),)

        );
      }
      if (state is ProductErrorState) {
        print(state.errorMessage);
        return Center(child: Text(state.errorMessage),);
      }
      return Container();
    }
    );
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
