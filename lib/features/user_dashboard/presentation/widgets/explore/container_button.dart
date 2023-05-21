import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../screens/explore/product_container.dart';

class ContainerButton extends StatefulWidget {
  const ContainerButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContainerButtonState createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {

  bool isClickableLeft = true;
  bool isClickableRight = false;
  Color backgroundColor = ColorManager.primary;
  @override
  Widget build(BuildContext context) {
    var cubit = HomeLayoutCubit.get(context);
    return BlocBuilder<HomeLayoutCubit , HomeLayOutStates>(
      builder: (context , state) {
        if (state is ApartmentLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primary,),
          );
        }
        if (state is ApartmentLoadedState) {
          return  Row(
            children: [
              moneyIcon(),
              spaceW(),
              Text(
                HomeLayoutCubit.get(context).price ??
                    state.apartment.apartments[0].info
                        .monthprice,
                style: getSemiBoldStylePoppins(
                  color: ColorManager.primary,
                  fontSize: AppSize.s18,
                ),
              ),
              const Spacer(),
              Container(
                height: AppSize.s40.h,
                width: AppSize.s200.w,
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(AppSize.s10)
                ),
                child: Row(
                  children: [
                    spaceW(),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          setState((){
                            isClickableLeft = true;
                            isClickableRight = false;
                            cubit.price = state.apartment.apartments[0].info.monthprice;
                          });
                        },
                        color: isClickableLeft? ColorManager.elevatedButton : backgroundColor,
                        height: AppSize.s25,
                        elevation: AppSize.s0,
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),
                        child: Text( "monthly" ,
                          style: getRegularStylePoppins(
                              fontSize: AppSize.s16,
                              color: isClickableLeft? ColorManager.primary : ColorManager.white
                          ),
                        ),
                      ),
                    ),
                    spaceW(),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          setState((){
                            isClickableRight = true;
                            isClickableLeft = false;
                            cubit.price = state.apartment.apartments[0].info.yearprice;
                          });
                        },
                        color: isClickableRight? ColorManager.elevatedButton : backgroundColor,
                        height: AppSize.s25,
                        elevation: AppSize.s0,
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),

                        child: Text("Yearly" ,
                          style: getRegularStylePoppins(
                              fontSize: AppSize.s16,
                              color: isClickableRight? ColorManager.primary : ColorManager.white
                          ),
                        ),
                      ),
                    ),
                    spaceW(),
                  ],
                ),
              ),
            ],
          );
        }
        return const Scaffold();
      },
    );
  }
}
