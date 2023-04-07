import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/map_based_homes/presentation/controller/map/map_cubit.dart';
import '../../features/authentication/domain/use_cases/logout_usecase.dart';
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

GetIt locator = GetIt.instance;

void injectorInitialization() {
  //Cubit
  locator
      .registerLazySingleton(() => RegisterCubit(registerUseCase: locator()));
  locator.registerLazySingleton(() => LoginCubit(loginUseCase: locator()));
  locator.registerLazySingleton(() =>
      OtpCubit(forgotPasswordUseCase: locator(), checkOTPUseCase: locator()));
  locator.registerLazySingleton(
      () => CreateNewPasswordCubit(createNewPasswordUseCase: locator()));
  locator.registerLazySingleton(() => HomeLayoutCubit(
        logoutUseCase: locator(),
      ));
  locator.registerLazySingleton(() => MapCubit());

  //Usecase
  locator.registerLazySingleton(() => RegisterUseCase(locator()));
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => ForgotPasswordUseCase(locator()));
  locator.registerLazySingleton(() => CheckOTPUseCase(locator()));
  locator.registerLazySingleton(() => CreateNewPasswordUseCase(locator()));
  locator.registerLazySingleton(() => LogoutUseCase(locator()));

  //Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  //DataSource
  locator.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //NetworkInfo
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));


  
}
