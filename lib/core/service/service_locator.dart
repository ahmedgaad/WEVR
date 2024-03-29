part of 'service_locator_imports.dart';

GetIt sl = GetIt.instance;

void serviceLocator() {
  //************************ CUBIT *******************************//
  sl.registerFactory(
    () => AuctionCubit(
      getAuctionUsecase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => RegisterCubit(
      registerUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoginCubit(
      loginUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => OtpCubit(
      forgotPasswordUseCase: sl(),
      checkOTPUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CreateNewPasswordCubit(
      createNewPasswordUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => HomeLayoutCubit(
      logoutUseCase: sl(),
      getApartmentUseCase: sl(),
      getSavedApartmentsUseCase: sl(), bookVisitUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => MapCubit(),
  );
  sl.registerLazySingleton(
    () => SearchCubit(
      searchUseCase: sl(), searchFilterUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SaveCubit(
      saveApartmentUsecCase: sl(),
    ),
  );

  //************************ USECASE *******************************//
  sl.registerLazySingleton(
    () => RegisterUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoginUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => ForgotPasswordUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CheckOTPUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CreateNewPasswordUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LogoutUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetApartmentUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SaveApartmentUsecCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetSavedApartmentsUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => SearchUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetAuctionUsecase(
      baseAuctionRepository: sl(),
    ),
  );
  sl.registerLazySingleton(() => BookVisitUseCase( homeRepository: sl(),));
  sl.registerLazySingleton(() => SearchFilterUseCase(
    homeRepository: sl(),
  ));

  //************************ REPOSITORY *******************************//
  sl.registerLazySingleton<BaseAuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplementation(
      homeRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<BaseAuctionRepository>(
    () => AuctionRepoImpl(
      networkInfo: sl(),
      baseAuctionRemoteDatasource: sl(),
    ),
  );

  //************************ DATASOURCE *******************************//
  sl.registerLazySingleton<BaseAuthDataSource>(
    () => AuthDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerFactory<BaseAuctionRemoteDatasource>(
    () => AuctionRemoteDatasourceImpl(),
  );

  //************************ EXTERNAL *******************************//
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );

  sl.registerLazySingleton<Dio>(() => Dio());
}
