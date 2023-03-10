import 'package:dartz/dartz.dart';
import '../entities/logout.dart';
import '../entities/check_otp.dart';
import '../entities/create_new_password.dart';
import '../entities/forgot_password.dart';
import '../../../../core/errors/failures.dart';
import '../entities/login.dart';
import '../entities/register.dart';

abstract class AuthRepository {
  Future<Either<Failure, Register>> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
    required String deviceInformation,
  });

  Future<Either<Failure, Logout>> logout({
    required String token,
  });

  Future<Either<Failure, ForgotPassword>> forgotPassword({
    required String email,
  });

  Future<Either<Failure, CheckOTP>> checkOTP({
    required int pinCode,
    required String email,
  });

  Future<Either<Failure, CreateNewPassword>> createNewPassword({
    required String password,
    required String passwordConfirmation,
    required String email,
  });
}
