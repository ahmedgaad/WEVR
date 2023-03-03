import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/authentication/domain/entities/register.dart';

abstract class AuthRepository {
  Future<Either<Failure, Register>> register(Register register);
}
