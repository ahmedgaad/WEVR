import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wevr_app/features/user_dashboard/data/datasources/home_remote_datasource.dart';
import 'package:wevr_app/features/user_dashboard/data/repository_implementation/home_repository_implementation.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/Save_apartment_usecase.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/get_apartment_use_case.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/get_saved_apartments_usecase.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/search_usecase.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/save/cubit.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/cubit.dart';
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
        getApartmentUseCase: locator(),
        // saveApartmentUsecCase: locator(),
        getSavedApartmentsUseCase: locator(),
      ));
  locator.registerLazySingleton(() => MapCubit());

  locator.registerLazySingleton(() => SearchCubit(searchUseCase: locator()));
  locator
      .registerLazySingleton(() => SaveCubit(saveApartmentUsecCase: locator()));

  //Usecase
  locator.registerLazySingleton(() => RegisterUseCase(locator()));
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => ForgotPasswordUseCase(locator()));
  locator.registerLazySingleton(() => CheckOTPUseCase(locator()));
  locator.registerLazySingleton(() => CreateNewPasswordUseCase(locator()));
  locator.registerLazySingleton(() => LogoutUseCase(locator()));
  locator.registerLazySingleton(() => GetApartmentUseCase(
        homeRepository: locator(),
      ));
  locator.registerLazySingleton(() => SaveApartmentUsecCase(
        homeRepository: locator(),
      ));
  locator.registerLazySingleton(() => GetSavedApartmentsUseCase(
        homeRepository: locator(),
      ));
  locator.registerLazySingleton(() => SearchUseCase(
        homeRepository: locator(),
      ));

  //Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator
      .registerLazySingleton<HomeRepository>(() => HomeRepositoryImplementation(
            homeRemoteDataSource: locator(),
            networkInfo: locator(),
          ));

  //DataSource
  locator.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  locator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceDio());

  //NetworkInfo
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}
