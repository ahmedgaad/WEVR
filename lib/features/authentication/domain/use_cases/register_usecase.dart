import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/register.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Either<Failure, Register>> call({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await authRepository.register(
      userName: userName,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
