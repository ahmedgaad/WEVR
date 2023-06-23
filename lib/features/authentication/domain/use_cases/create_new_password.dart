import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/create_new_password.dart';
import '../repository/auth_repository.dart';

class CreateNewPasswordUseCase {
  final BaseAuthRepository authRepository;
  CreateNewPasswordUseCase(this.authRepository);

  Future<Either<Failure, CreateNewPassword>> call({
    required String password,
    required String passwordConfirmation,
    required String email,
  }) async {
    return await authRepository.createNewPassword(
      password: password,
      passwordConfirmation: passwordConfirmation,
      email: email,
    );
  }
}
