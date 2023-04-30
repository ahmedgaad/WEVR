import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wevr_app/features/user_dashboard/data/repository_implementation/repository_implementation.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/get_product_usecase.dart';
import '../../features/authentication/domain/use_cases/logout_usecase.dart';
import '../../features/user_dashboard/data/data_sources/remote_datasource.dart';
import '../../features/user_dashboard/domain/use_cases/get_banner_usecase.dart';
import '../../features/user_dashboard/presentation/controller/Home/cubit.dart';
import '../../features/authentication/domain/use_cases/check_otp_usecase.dart';
import '../../features/authentication/domain/use_cases/create_new_password.dart';
import '../../features/authentication/domain/use_cases/forgot_password_usecase.dart';
import '../../features/authentication/domain/use_cases/login_usecase.dart';
import '../../features/authentication/presentation/controller/OTP/otp_cubit.dart';
import '../../features/authentication/presentation/controller/create_new_password/cubit.dart';
import '../../features/authentication/presentation/controller/login/cubit.dart';

import '../../features/authentication/data/data_sources/remote_datasource.dart';
import '../../features/authentication/data/repository_implementation/repository_impl.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/authentication/domain/use_cases/register_usecase.dart';
import '../../features/authentication/presentation/controller/register/cubit.dart';
import '../network/network_info.dart';

GetIt getIt = GetIt.instance;

void initializeInjector() {
  //Cubit
  getIt.registerLazySingleton(() => RegisterCubit(registerUseCase: getIt()));
  getIt.registerLazySingleton(() => LoginCubit(loginUseCase: getIt()));
  getIt.registerLazySingleton(
      () => OtpCubit(forgotPasswordUseCase: getIt(), checkOTPUseCase: getIt()));
  getIt.registerLazySingleton(
      () => CreateNewPasswordCubit(createNewPasswordUseCase: getIt()));
  getIt.registerLazySingleton(() => HomeLayoutCubit(
        logoutUseCase: getIt(),
        getProductUseCase: getIt(),
    getBannerUseCase: getIt(),
      ));

  //Usecase
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgotPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckOTPUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateNewPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProductUseCase(homeRepo: getIt()));
  getIt.registerLazySingleton(() => GetBannersUseCase(homeRepo: getIt()));

  //Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepositoryImpl(
      homeDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  //DataSource
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());

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
