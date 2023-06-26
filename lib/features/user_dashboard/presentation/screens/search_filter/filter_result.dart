import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/screens/search_filter/filters.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../controller/search/states.dart';
import '../../widgets/search/filter_widget.dart';
import '../../widgets/search/search_bar_widget.dart';
import '../explore/department_details.dart';
import '../explore/product_container.dart';
import '../home/home_view.dart';

class FilterResult extends StatelessWidget {
  const FilterResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit ,SearchStates>(
        builder: (context , state){
          return Scaffold(
            backgroundColor: ColorManager.exploreBackground,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            navigatePush(context, const FiltersView());
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        15.pw,
                        SearchBarWidget(width: 240.w, height: 50.h,),
                        15.pw,
                        const FilterWidget(),
                      ],
                    ),
                    15.ph,
                    if (state is SearchFilterLoadingState)
                      const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          )),
                    if (state is SearchFilterSuccessLoadedState)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 270.w,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder:
                                  (BuildContext context, int index) =>
                                  Container(
                                    width: AppSize.s255.w,
                                    height: AppSize.s360.h,
                                    decoration: const BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: GestureDetector(
                                              onTap: () {
                                                navigatePush(context,
                                                    const DepartmentDetails());
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
                                                state.results[index].type,
                                                style: getMediumStylePoppins(
                                                  color: ColorManager.lightPink,
                                                  fontSize: AppSize.s16,
                                                ),
                                              ),
                                              const Spacer(),
                                              // FavIcon(id: state.results[index].),
                                            ],
                                          ),
                                          spaceH(),
                                          Row(
                                            children: [
                                              icon(
                                                icon:
                                                Icons.location_on_outlined,
                                              ),
                                              spaceW(),
                                              Text(
                                                state.results[index].location,
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
                                                state.results[index].monthPrice,
                                                style: getSemiBoldStylePoppins(
                                                  color: ColorManager.primary,
                                                  fontSize: AppSize.s16,
                                                ),
                                              ),
                                              const Text('/month'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                  Container(
                                    height: 20,
                                  ),
                              itemCount: state.results.length,
                            ),
                          ),
                        ],
                      ),
                    15.ph,
                    if (state is SearchFilterErrorLoadedState)
                      Center(
                        child: Text(
                          'There is no result',
                          style: getMediumStylePoppins(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
