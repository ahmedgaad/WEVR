import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/states.dart';
import 'package:wevr_app/features/user_dashboard/presentation/screens/search_filter/filter_result.dart';
import '../../../../../core/utils/color_manager.dart';
import '../explore/product_container.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  bool isClickableLeft = true;

  bool isClickableRight = false;

  bool isClickableMiddle = false;

  Color backgroundColor = ColorManager.primary;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = SearchCubit.get(context);
        var selectedRange = const RangeValues(1000, 10000);
        RangeLabels labels = RangeLabels(
            selectedRange.start.toString(), selectedRange.end.toString());
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Filters",
              style: getSemiBoldStylePoppins(fontSize: AppSize.s20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Property Type',
                  style: getMediumStylePoppins(
                    fontSize: AppSize.s16,
                  ),
                ),
                20.ph,
                Container(
                  height: 57.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSize.s10)),
                  child: Row(
                    children: [
                      spaceW(),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              isClickableLeft = true;
                              isClickableRight = false;
                              isClickableMiddle = false;
                              navigatePush(context, const FilterResult());
                              cubit.searchFilter(1, 0, 0, 0, 0, 0);
                            });
                          },
                          color: isClickableLeft
                              ? ColorManager.elevatedButton
                              : backgroundColor,
                          height: 35.h,
                          elevation: AppSize.s0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s0),
                          child: Text(
                            "Apartment",
                            style: getRegularStylePoppins(
                                fontSize: AppSize.s16,
                                color: isClickableLeft
                                    ? ColorManager.primary
                                    : ColorManager.white),
                          ),
                        ),
                      ),
                      spaceW(),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              isClickableMiddle = true;
                              isClickableLeft = false;
                              isClickableRight = false;
                              navigatePush(context, const FilterResult());
                              cubit.searchFilter(2, 0, 0, 0, 0, 0);
                            });
                          },
                          color: isClickableMiddle
                              ? ColorManager.elevatedButton
                              : backgroundColor,
                          height: 35.h,
                          elevation: AppSize.s0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s0),
                          child: Text(
                            "Duplex",
                            style: getRegularStylePoppins(
                                fontSize: AppSize.s16,
                                color: isClickableMiddle
                                    ? ColorManager.primary
                                    : ColorManager.white),
                          ),
                        ),
                      ),
                      spaceW(),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              isClickableRight = true;
                              isClickableLeft = false;
                              isClickableMiddle = false;
                              navigatePush(context, const FilterResult());
                              cubit.searchFilter(3, 0, 0, 0, 0, 0);
                            });
                          },
                          color: isClickableRight
                              ? ColorManager.elevatedButton
                              : backgroundColor,
                          height: 35.h,
                          elevation: AppSize.s0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s0),
                          child: Text(
                            "Villa",
                            style: getRegularStylePoppins(
                                fontSize: AppSize.s16,
                                color: isClickableRight
                                    ? ColorManager.primary
                                    : ColorManager.white),
                          ),
                        ),
                      ),
                      spaceW(),
                    ],
                  ),
                ),
                20.ph,
                Center(
                  child: Container(
                    width: 300.w,
                    height: 1.h,
                    color: ColorManager.darkGrey,
                  ),
                ),
                20.ph,
                Text(
                  'Price monthly',
                  style: getMediumStylePoppins(
                    fontSize: AppSize.s16,
                  ),
                ),
                20.ph,
                Center(
                  child: RangeSlider(
                    min: 900,
                    max: 10000,
                    activeColor: ColorManager.primary,
                    values: selectedRange,
                    labels: labels,
                    divisions: 4,
                    onChanged: (newRange) {
                      setState(() {
                        selectedRange = newRange;
                      });
                    },
                  ),
                ),
                20.ph,
                Center(
                  child: Container(
                    width: 300.w,
                    height: 1.h,
                    color: ColorManager.darkGrey,
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
