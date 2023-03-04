import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/authentication/domain/entities/register.dart';
import 'package:wevr_app/features/authentication/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Either<Failure, Register>> execute({
    required String userName,
    required String email,
    required String phone,
  }) async {
    return await authRepository.register(
        userName: userName, email: email, phone: phone);
  }
}
