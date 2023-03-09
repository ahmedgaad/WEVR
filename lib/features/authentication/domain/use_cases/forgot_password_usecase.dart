import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/authentication/domain/entities/forgot_password.dart';
import 'package:wevr_app/features/authentication/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository authRepository;
  ForgotPasswordUseCase(this.authRepository);

  Future<Either<Failure, ForgotPassword>> call({
    required String email,
  }) async {
    return await authRepository.forgotPassword(
      email: email,
    );
  }
}
