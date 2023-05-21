// ignore_for_file: prefer_const_constructors_in_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wevr_app/core/localization/change_locale.dart';
import 'package:wevr_app/core/localization/translations.dart';
import 'package:wevr_app/core/service/service_locator.dart';
import 'package:wevr_app/core/utils/languages_manager.dart';
import 'package:wevr_app/core/utils/routes_manager.dart';
import 'package:wevr_app/core/utils/themes_manager.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_cubit.dart';
import 'package:wevr_app/features/introduction/presentation/screens/splash/splash_view.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/cubit.dart';
import 'dart:ui' as ui;

class Wevr extends StatefulWidget {
  const Wevr({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  State<Wevr> createState() => _WevrState();
}

class _WevrState extends State<Wevr> {
  //MyApp._internal(this.startWidget); //named constructor
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    precacheImage(
        const AssetImage("assets/images/logo/get_started.jpg"), context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => OtpCubit(
              checkOTPUseCase: locator(), forgotPasswordUseCase: locator()),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeLayoutCubit(
            getApartmentUseCase: locator(),
            logoutUseCase: locator(),
            // saveApartmentUsecCase: locator(),
            getSavedApartmentsUseCase: locator(),
          )..getApartment(),
        ),
        BlocProvider(
          create: (BuildContext context) => MapCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SearchCubit(
            searchUseCase: locator(),
          ),
        ),

      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            translations: WevrTranslations(),
            locale: localeController.language,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: widget.initialRoute,
            theme: getThemeData(),
          );
        },
      ),
    );
  }
}
