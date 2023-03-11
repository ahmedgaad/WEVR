import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_cubit.dart';
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

GetIt getIt = GetIt.instance;

void injectorInitialization() {
  //Cubit
  getIt.registerLazySingleton(() => RegisterCubit(registerUseCase: getIt()));
  getIt.registerLazySingleton(() => LoginCubit(loginUseCase: getIt()));
  getIt.registerLazySingleton(
      () => OtpCubit(forgotPasswordUseCase: getIt(), checkOTPUseCase: getIt()));
  getIt.registerLazySingleton(
      () => CreateNewPasswordCubit(createNewPasswordUseCase: getIt()));
  getIt.registerLazySingleton(() => HomeLayoutCubit(
        logoutUseCase: getIt(),
      ));
  getIt.registerLazySingleton(() => MapCubit());

  //Usecase
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgotPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckOTPUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateNewPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));

  //Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  //DataSource
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

  //NetworkInfo
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

}
