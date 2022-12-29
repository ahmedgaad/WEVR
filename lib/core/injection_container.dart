import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wevr_app/data/data_sources/remote_data_source/web_services.dart';
import 'package:wevr_app/presentation/screens/register/cubit/cubit.dart';

import '../data/repository_implementation/repository_impl.dart';
import '../domain/repository/users_repository.dart';
import '../domain/usecases/register_new_user.dart';

GetIt getIt = GetIt.instance;
void initializeInjector() {
  //Cubit
  getIt.registerLazySingleton(
      () => RegisterCubit(registerNewUserUseCase: getIt()));

  //Usecase
  getIt.registerLazySingleton(() => RegisterNewUserUseCase(getIt()));

  //Repository
  getIt.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(getIt()));

  //WebServices
  getIt
      .registerLazySingleton<WebService>(() => WebService(createAndSetupDio()));

  //Shared Pref
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 20 * 100
    ..options.receiveTimeout = 20 * 100;

  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      responseHeader: false,
      requestHeader: false,
      request: true,
      error: true));

  return dio;
}
