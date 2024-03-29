import 'package:flutter/material.dart';
import '../../../features/authentication/presentation/screens/OTP/forgot_password_screen.dart';
import '../../../features/authentication/presentation/screens/OTP/reset_pass/reset_pass.dart';
import '../../../features/authentication/presentation/screens/OTP/reset_via_phone/reset_phone_view.dart';
import '../../../features/authentication/presentation/screens/login/login_view.dart';
import '../../../features/authentication/presentation/screens/register/register_successfully.dart';
import '../../../features/authentication/presentation/screens/register/register_view.dart';
import '../../../features/introduction/presentation/screens/get_started/get_started_view.dart';
import '../../../features/introduction/presentation/screens/onboarding/onboarding_view.dart';
import '../../../features/introduction/presentation/screens/splash/splash_view.dart';
import '../../../features/user_dashboard/presentation/screens/home/home_view.dart';
import '../../../features/user_profile/presentation/screens/account_setting/account_setting.dart';
import '../../../features/user_profile/presentation/screens/contact_us/contact_us.dart';
import '../../../features/user_profile/presentation/screens/language/language.dart';
import '../../../features/user_profile/presentation/screens/my_properties/my_properties.dart';
import '../../../features/user_profile/presentation/screens/payment/payment.dart';
import '../../../features/user_profile/presentation/screens/personal_info/personal_information.dart';
import '../../../features/user_profile/presentation/screens/privacy_policy/privacy_policy.dart';
import '../../../features/user_profile/presentation/screens/profile/profile_view.dart';
import '../../../features/user_profile/presentation/screens/show_your_properties/show_your_properties.dart';
import '../../utils/strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = '/onBoarding';
  static const String getStartedRoute = '/getStarted';
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String registerSuccessRoute = "/registerSuccess";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String homeRoute = "/home";
  static const String resetPhoneRoute = "/resetPhone";
  static const String resetEmailRoute = "/resetEmail";
  static const String forgotRoute = "/forgot";
  static const String personalInfoRoute = "/personalInformation";
  static const String accountSettingRoute = "/accountSetting";
  static const String paymentRoute = "/payment";
  static const String languageRoute = "/language";
  static const String contactUsRoute = "/ContactUs";
  static const String privacyPolicyRoute = "/privacyPolicy";
  static const String myPropertiesRoute = "/myProperties";
  static const String showYourPropertiesRoute = "/showYourProperties";
  static const String profileRoute = "/profileRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.getStartedRoute:
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
      // case Routes.resetEmailRoute:
      //   return MaterialPageRoute(builder: (_) => const ResetEmailView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.personalInfoRoute:
        return MaterialPageRoute(builder: (_) => PersonalInformation());
      case Routes.accountSettingRoute:
        return MaterialPageRoute(builder: (_) => const AccountSetting());
      case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => const Payment());
      case Routes.languageRoute:
        return MaterialPageRoute(builder: (_) => const LanguageView());
      case Routes.contactUsRoute:
        return MaterialPageRoute(builder: (_) => const ContactUs());
      case Routes.privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicy());
      case Routes.myPropertiesRoute:
        return MaterialPageRoute(builder: (_) => const MyProperties());
      case Routes.showYourPropertiesRoute:
        return MaterialPageRoute(builder: (_) => const ShowYourProperties());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case Routes.forgotRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      default:
        return undefinedRoute();
    } //switch
  } //getRoute

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  StringsManager.noRouteFound,
                ),
              ),
              body: const Center(
                child: Text(StringsManager.noRouteFound),
              ),
            ));
  } //static function that return undefined route

  static MaterialPageRoute navigateTo(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
