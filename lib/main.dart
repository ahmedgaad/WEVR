import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wevr_app/core/get_device_info.dart';
import 'package:wevr_app/core/injection_container.dart';
import 'package:wevr_app/core/utils/constants_manager.dart';
import 'package:wevr_app/presentation/screens/get_started/get_started_view.dart';
import 'package:wevr_app/presentation/screens/home/home_view.dart';
import 'package:wevr_app/presentation/screens/login/login_view.dart';
import 'package:wevr_app/presentation/screens/onboarding/onboarding_view.dart';

import 'app/app.dart';
import 'core/bloc_observer.dart';
import 'core/utils/languages_manager.dart';
import 'data/data_sources/local_data_source/cache_helper.dart';

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

  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
      path: ASSET_PATH_LOCALIZATION,
      child: Phoenix(
        child: const Wevr(
          //startWidget: widget,
        ),
      )));
}
