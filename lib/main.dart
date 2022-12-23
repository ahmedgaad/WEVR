import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wevr_app/core/injection_container.dart';

import 'app/app.dart';
import 'core/bloc_observer.dart';
import 'core/utils/languages_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  initializeInjector();
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
      path: ASSET_PATH_LOCALIZATION,
      child: Phoenix(
        child: MyApp(),
      )));
}
