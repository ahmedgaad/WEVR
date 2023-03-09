// ignore_for_file: prefer_const_constructors_in_immutables, depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/service/injection_container.dart';
import 'package:wevr_app/core/utils/languages_manager.dart';
import 'package:wevr_app/core/utils/routes_manager.dart';
import 'package:wevr_app/core/utils/themes_manager.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_cubit.dart';
import 'package:wevr_app/features/introduction/presentation/screens/splash/splash_view.dart';
// import 'dart:ui' as ui;

class Wevr extends StatefulWidget {
  const Wevr({super.key});

  @override
  State<Wevr> createState() => _WevrState();
}

class _WevrState extends State<Wevr> {
  //MyApp._internal(this.startWidget); //named constructor
  @override
  Widget build(BuildContext context) {
    precacheImage(
        const AssetImage("assets/images/logo/get_started.jpg"), context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => OtpCubit(
              checkOTPUseCase: getIt(), forgotPasswordUseCase: getIt()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            //home: startWidget,
            theme: getThemeData(),
            builder: (context, child) {
              return Directionality(
                  // ignore: unrelated_type_equality_checks
                  textDirection: context.locale.languageCode == ARABIC_LOCALE
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: child ?? const SplashView());
            },
          );
        },
      ),
    );
  }
}
