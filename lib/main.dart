import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:wevr_app/core/functions/debug_message.dart';
import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'app.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/service/service_locator_imports.dart';

void main() async {
  debugMessage('--main');
  WidgetsFlutterBinding.ensureInitialized();
  debugMessage('--main: WidgetsFlutterBinding.ensureInitialized');

  await CacheHelper.cacheInitialization();

  serviceLocator();
  debugMessage('--main: serviceLocator');

  Bloc.observer = MyBlocObserver();
  debugMessage('--main: BlocObserver');
  runApp(
    const Wevr(),
  );
}