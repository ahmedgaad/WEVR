import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/logout.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;
  LogoutUseCase(this.authRepository);

  Future<Either<Failure, Logout>> call({
    required String token,
  }) async {
    return await authRepository.logout(
      token: token,
    );
  }
}