import 'package:flutter/material.dart';
import '../../modules/register/register_successfuly.dart';
import '../../modules/otp_process/reset_via_email/reset_email_view.dart';
import '../../modules/otp_process/reset_via_phone/reset_phone_view.dart';
import 'strings_manager.dart';

import '../../modules/otp_process/forgot_password/forgot_password_view.dart';
import '../../modules/get_started/get_started_view.dart';
import '../../modules/home/home_view.dart';
import '../../modules/login/login_view.dart';
import '../../modules/onboarding/onboarding_view.dart';
import '../../modules/register/register_view.dart';
import '../../modules/splash/splash_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = '/onBoarding';
  static const String getStarted = '/getStarted';
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String registerSuccessRoute = "/registerSuccess";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String homeRoute = "/home";
  static const String resetPhoneRoute = "/resetPhone";
  static const String resetEmailRoute = "/resetEmail";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.getStarted:
        return MaterialPageRoute(builder: (_) => const GetStartedView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.registerSuccessRoute:
        return MaterialPageRoute(builder: (_) => const RegisterSuccessfully());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.resetPhoneRoute:
        return MaterialPageRoute(builder: (_) => const ResetPhoneView());
      case Routes.resetEmailRoute:
        return MaterialPageRoute(builder: (_) => const ResetEmailView());
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