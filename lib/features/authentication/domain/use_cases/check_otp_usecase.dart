import 'package:dartz/dartz.dart';
import 'package:wevr_app/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/check_otp.dart';

class CheckOTPUseCase {
  final AuthRepository authRepository;
  CheckOTPUseCase(this.authRepository);

  Future<Either<Failure, CheckOTP>> call({
    required int pinCode,
    required String email,
  }) async {
    return await authRepository.checkOTP(
      pinCode: pinCode,
      email: email,
    );
  }
}
