import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../domain/entities/check_otp.dart';
import '../../domain/entities/create_new_password.dart';
import '../../domain/entities/forgot_password.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/logout.dart';
import '../../domain/entities/register.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Register>> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.register(
            userName: userName,
            email: email,
            phone: phone,
            password: password,
            passwordConfirmation: passwordConfirmation);
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on RegisterException catch (failure) {
      return Left(ServerFailure(failure.registerErrorModel.errorMessage));
    } on OfflineException {
      return const Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
    required String deviceInformation,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.login(
          email: email,
          password: password,
          deviceInformation: deviceInformation,
        );
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on LoginException catch (failure) {
      return Left(ServerFailure(failure.loginErrorModel.errorMessage));
    } on OfflineException {
      return const Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, ForgotPassword>> forgotPassword({
    required String email,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.forgotPassword(
          email: email,
        );
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on ForgotPasswordException catch (failure) {
      return Left(ServerFailure(failure.forgotPasswordErrorModel.errorMessage));
    } on OfflineException {
      return const Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, CheckOTP>> checkOTP({
    required int pinCode,
    required String email,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.checkOTP(
          email: email,
          pinCode: pinCode,
        );
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on CheckOTPException catch (failure) {
      return Left(ServerFailure(failure.checkOTPErrorModel.errorMessage));
    } on OfflineException {
      return const Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, CreateNewPassword>> createNewPassword({
    required String password,
    required String passwordConfirmation,
    required String email,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.createNewPassword(
          password: password,
          passwordConfirmation: passwordConfirmation,
          email: email,
        );
        return Right(result);
      } else {
        throw OfflineException();
      }
    } on CreateNewPasswordException catch (failure) {
      return Left(
          ServerFailure(failure.createNewPasswordErrorModel.errorMessage));
    } on OfflineException {
      return const Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }

  @override
  Future<Either<Failure, Logout>> logout({
    required String token,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await authDataSource.logout(
          token: token,
        );
        return Right(result);
      } else {
        return const Left(
            OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
      }
    } on ServerFailure {
      return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
    } on OfflineFailure {
      return const Left(OfflineFailure(StringsManager.OFFLINE_FAILURE_MESSAGE));
    }
  }
}
