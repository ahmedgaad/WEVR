import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/assets_manager.dart';
import 'package:wevr_app/core/utils/constants.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/states.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class BookVisitView extends StatefulWidget {
  const BookVisitView({Key? key}) : super(key: key);

  @override
  State<BookVisitView> createState() => _BookVisitViewState();
}

class _BookVisitViewState extends State<BookVisitView> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayOutStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if (state is ApartmentLoadedState) {
          return Scaffold(
            backgroundColor: ColorManager.exploreBackground,
            appBar: AppBar(
              backgroundColor: ColorManager.exploreBackground,
              title: Text(
                "book visit",
                style: getSemiBoldStylePoppins(
                  color: ColorManager.black,
                  fontSize: 20,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(AssetsImagesManager.apartment),
                    ),
                    15.ph,
                    Text(
                      'Select Date',
                      style: getSemiBoldStyleInter(
                        color: ColorManager.black,
                        fontSize: AppSize.s16,
                      ),
                    ),
                    15.ph,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.white,
                      ),
                      child: TableCalendar(
                        locale: 'en_US',
                        focusedDay: today,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.utc(2023, 12, 30),
                        onDaySelected: _onDaySelected,
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: ColorManager.lightPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          selectedDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                    ),
                    25.ph,
                    Row(
                      children: [
                        Expanded(
                            child: timeWidget(ColorManager.primary, '1:30 Pm')),
                        5.pw,
                        Expanded(
                            child: timeWidget(
                                ColorManager.lightPrimary, '3:30 Pm')),
                        5.pw,
                        Expanded(
                            child: timeWidget(
                                ColorManager.lightPrimary, '1:30 Pm')),
                        5.pw,
                        Expanded(
                            child:
                                timeWidget(ColorManager.lightGrey, '1:30 Pm')),
                        5.pw,
                        Expanded(
                            child:
                                timeWidget(ColorManager.lightGrey, '1:30 Pm')),
                        5.pw,
                        Expanded(
                            child: timeWidget(
                                ColorManager.lightPrimary, '1:30 Pm')),
                        5.pw,
                        Expanded(
                            child: timeWidget(
                                ColorManager.lightPrimary, '1:30 Pm')),
                      ],
                    ),
                    15.ph,
                    Center(
                      child: defaultButton(
                        function: () {
                          HomeLayoutCubit.get(context).bookVisitUseCase(
                              id: state.apartment.apartments[0].id,
                              dateTime: today,
                              );
                          
                        },
                        text: 'Save',
                        width: 280.w,
                        isUpperCase: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget timeWidget(Color color, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 40.w,
        height: 75.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            text,
            style: getMediumStylePoppins(
              fontSize: AppSize.s14,
              color: ColorManager.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
