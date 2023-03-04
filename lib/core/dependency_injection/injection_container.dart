import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wevr_app/core/network/network_info.dart';
import 'package:wevr_app/features/authentication/data/data_sources/remote_datasource.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/register_usecase.dart';
import '../../features/authentication/data/repository_implementation/repository_impl.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/authentication/presentation/screens/login/cubit/cubit.dart';
import '../../features/authentication/presentation/screens/register/cubit/cubit.dart';
import '../../features/user_dashboard/presentation/screens/home/cubit/cubit.dart';

GetIt getIt = GetIt.instance;

void initializeInjector() {
  //Cubit
  // getIt.registerLazySingleton(() => LoginCubit(loginUserUseCase: getIt()));
  getIt.registerLazySingleton(
      () => RegisterCubit(registerUseCase: getIt()));
  // getIt.registerLazySingleton(() => HomeLayoutCubit(logoutUseCase: getIt()));

  //Usecase
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));

  //Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  //DataSource
  getIt.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl());

  //NetworkInfo
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  //Shared Pref
}












// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:wevr_app/features/authentication/domain/use_cases/register_usecase.dart';
// import '../../features/authentication/data/repository_implementation/repository_impl.dart';
// import '../../features/authentication/domain/repository/auth_repository.dart';
// import '../../features/authentication/presentation/screens/login/cubit/cubit.dart';
// import '../../features/authentication/presentation/screens/register/cubit/cubit.dart';
// import '../../features/user_dashboard/presentation/screens/home/cubit/cubit.dart';

// GetIt getIt = GetIt.instance;

// void initializeInjector() {
//   //Cubit
//   getIt.registerLazySingleton(() => LoginCubit(loginUserUseCase: getIt()));
//   getIt.registerLazySingleton(
//       () => RegisterCubit(registerNewUserUseCase: getIt()));
//   getIt.registerLazySingleton(() => HomeLayoutCubit(logoutUseCase: getIt()));

//   //Usecase
//   getIt.registerLazySingleton(() => RegisterUseCase(getIt()));

//   //Repository
//   getIt.registerLazySingleton<AuthRepository>(
//       () => UsersRepositoryImpl(getIt()));

//   //WebServices
//   // getIt
//   //     .registerLazySingleton<WebService>(() => WebService(createAndSetupDio()));

//   //Shared Pref
// }

// Dio createAndSetupDio() {
//   Dio dio = Dio();

//   dio
//     ..options.connectTimeout = 20 * 100
//     ..options.receiveTimeout = 20 * 100;

//   dio.interceptors.add(LogInterceptor(
//       responseBody: true,
//       requestBody: true,
//       responseHeader: false,
//       requestHeader: false,
//       request: true,
//       error: true));

//   return dio;
// }
