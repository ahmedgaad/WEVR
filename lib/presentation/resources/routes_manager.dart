import 'package:flutter/material.dart';
import 'package:wevr_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:wevr_app/presentation/home/home_view.dart';
import 'package:wevr_app/presentation/login/login_view.dart';
import 'package:wevr_app/presentation/register/register_view.dart';
import 'package:wevr_app/presentation/resources/strings_manager.dart';
import 'package:wevr_app/presentation/splash/splash_view.dart';

import '../onboarding/onboarding_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String homeRoute = "/home";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return undefinedRoute();
    } //switch
  }//getRoute

  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (_) =>
         Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.noRouteFound,
            ),
          ),
           body: const Center(
             child: Text(AppStrings.noRouteFound),
           ),
        )
    );
  }//static function that return undefined route
}