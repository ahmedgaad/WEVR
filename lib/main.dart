import 'package:flutter/material.dart';
import 'package:wevr_app/shared/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:wevr_app/shared/network/local/cache_helper.dart';
import 'package:wevr_app/shared/network/remote/dio_helper.dart';
import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

