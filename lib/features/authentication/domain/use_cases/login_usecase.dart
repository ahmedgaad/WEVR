import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/authentication/domain/repository/auth_repository.dart';

import '../entities/login.dart';

class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  //callable method
  Future<Either<Failure, Login>> call({
    required String email,
    required String password,
    required String deviceInformation,
  }) async {
    return await authRepository.login(
      email: email,
      password: password,
      deviceInformation: deviceInformation,
    );
  }
}