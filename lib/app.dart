// ignore_for_file: prefer_const_constructors_in_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:wevr_app/core/functions/first_launch.dart';
// import 'package:wevr_app/core/functions/is_authorized.dart';
import 'package:wevr_app/core/localization/change_locale.dart';
import 'package:wevr_app/core/localization/translations.dart';
import 'package:wevr_app/core/config/routes/routes_manager.dart';
import 'package:wevr_app/core/utils/constants.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_cubit.dart';
import 'package:wevr_app/features/authentication/presentation/controller/login/cubit.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/Home/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/auction/auction_cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/cubit.dart';
import 'core/config/themes/light_theme.dart';
import 'core/service/service_locator_imports.dart';
import 'features/introduction/presentation/screens/splash/splash_view.dart';

class Wevr extends StatefulWidget {
  const Wevr({super.key});

  @override
  State<Wevr> createState() => _WevrState();
}

class _WevrState extends State<Wevr> with WidgetsBindingObserver {
  String? initialRoute;

  // @override
  // void initState() {
  //   isFirstLaunch().then((firstlaunch) {
  //     if (firstlaunch) {
  //       initialRoute = Routes.onBoardingRoute;
  //     } else if (isAuthorized()) {
  //       initialRoute = Routes.homeRoute;
  //     } else {
  //       initialRoute = Routes.getStartedRoute;
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    precacheImage(
        const AssetImage("assets/images/logo/get_started.jpg"), context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              OtpCubit(checkOTPUseCase: sl(), forgotPasswordUseCase: sl()),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(loginUseCase: sl()),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeLayoutCubit(
            getApartmentUseCase: sl(),
            logoutUseCase: sl(),
            // saveApartmentUsecCase: locator(),
            getSavedApartmentsUseCase: sl(),
          )..getApartment(),
        ),
        BlocProvider(
          create: (BuildContext context) => MapCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SearchCubit(
            searchUseCase: sl(),
          ),
        ),
        BlocProvider(
          create: (_) => LoginCubit(
            loginUseCase: sl<LoginUseCase>(),
          ),
        ),
        // BlocProvider(
        //   create: (BuildContext context) =>
        //       AuctionCubit(getAuctionUsecase: sl())..getAuctions(),
        // ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        rebuildFactor: RebuildFactors.all,
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            translations: WevrTranslations(),
            locale: localeController.language,
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,
            onGenerateInitialRoutes: (_) {
              Future.delayed(const Duration(seconds: Constants.splashDelay))
                  .then((value) {
                Get.offAndToNamed(initialRoute ?? Routes.getStartedRoute);
              });
              return [
                MaterialPageRoute(
                  builder: (context) => const SplashView(),
                ),
              ];
            },
          );
        },
      ),
    );
  }
}
