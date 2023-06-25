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
import '../../features/user_dashboard/domain/use_cases/book_visit_usecase.dart';
import '../../features/user_dashboard/domain/use_cases/search_filter_usecase.dart';
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

GetIt sl = GetIt.instance;

void injectorInitialization() {
  //Cubit
  sl.registerLazySingleton(() => RegisterCubit(registerUseCase: sl()));
  sl.registerLazySingleton(() => LoginCubit(loginUseCase: sl()));
  sl.registerLazySingleton(
      () => OtpCubit(forgotPasswordUseCase: sl(), checkOTPUseCase: sl()));
  sl.registerLazySingleton(
      () => CreateNewPasswordCubit(createNewPasswordUseCase: sl()));
  sl.registerLazySingleton(() => HomeLayoutCubit(
        logoutUseCase: sl(),
        getApartmentUseCase: sl(),
        // saveApartmentUsecCase: locator(),
        getSavedApartmentsUseCase: sl(),
    bookVisitUseCase: sl(),
      ));
  sl.registerLazySingleton(() => MapCubit());

  sl.registerLazySingleton(() => SearchCubit(searchUseCase: sl(), searchFilterUseCase: sl()));
  sl.registerLazySingleton(() => SaveCubit(saveApartmentUsecCase: sl()));

  //Usecase
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
  sl.registerLazySingleton(() => CheckOTPUseCase(sl()));
  sl.registerLazySingleton(() => CreateNewPasswordUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => BookVisitUseCase( homeRepository: sl(),));
  sl.registerLazySingleton(() => GetApartmentUseCase(
        homeRepository: sl(),
      ));
  sl.registerLazySingleton(() => SaveApartmentUsecCase(
        homeRepository: sl(),
      ));
  sl.registerLazySingleton(() => GetSavedApartmentsUseCase(
        homeRepository: sl(),
      ));
  sl.registerLazySingleton(() => SearchUseCase(
        homeRepository: sl(),
      ));
  sl.registerLazySingleton(() => SearchFilterUseCase(
    homeRepository: sl(),
  ));

  //Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImplementation(
        homeRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //DataSource
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceDio());

  //NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
}
