import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/forgot_password.dart';
import '../repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final BaseAuthRepository authRepository;
  ForgotPasswordUseCase(this.authRepository);

  Future<Either<Failure, ForgotPassword>> call({
    required String email,
  }) async {
    return await authRepository.forgotPassword(
      email: email,
    );
  }
}
