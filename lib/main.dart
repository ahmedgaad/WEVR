// ignore: depend_on_referenced_packages
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'package:wevr_app/core/utils/constants_manager.dart';
import 'package:wevr_app/core/utils/routes_manager.dart';
import 'app.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/service/service_locator.dart';
import 'core/utils/languages_manager.dart';

late String initialRoute;
void main() async {
  log('--main');
  WidgetsFlutterBinding.ensureInitialized();
  log('--main: WidgetsFlutterBinding.ensureInitialized');

  await CacheHelper.cacheInitialization();

  injectorInitialization();
  log('--main: injectorInitialization');

  Bloc.observer = MyBlocObserver();
  log('--main: BlocObserever');
  runApp(
    Wevr(
      initialRoute: Routes.splashRoute,
    ),
  );
}
