import 'package:dartz/dartz.dart';
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
}
