// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:wevr_app/core/dependency_injection/injection_container.dart';
import 'package:wevr_app/core/get_device_info.dart';
import 'package:wevr_app/core/helpers/cache_helper/cache_helper.dart';

import 'app.dart';
import 'core/bloc_observer.dart';
import 'core/utils/languages_manager.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await getDeviceInfo();
  initializeInjector();
  await CacheHelper.init();
  // Widget? widget;
  //
  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // AppConstants.token = CacheHelper.getData(key: 'token')?? "";
  // if (onBoarding != null) {
  //   if (AppConstants.token.isNotEmpty) {
  //     widget = const HomeView();
  //   }  else{
  //     widget = const GetStartedView();
  //   }
  // }  else{
  //   widget = const OnBoardingView();
  // }

  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
      saveLocale: true,
      startLocale: ENGLISH_LOCALE,
      fallbackLocale: ENGLISH_LOCALE,
      path: ASSET_PATH_LOCALIZATION,
      child: const Wevr(),
    ),
  );
}
