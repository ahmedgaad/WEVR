import 'auth_error_models.dart';

class OfflineException implements Exception {}

class RegisterException implements Exception {
  final RegisterErrorModel registerErrorModel;
  RegisterException({
    required this.registerErrorModel,
  });
}

class LoginException implements Exception {
  final LoginErrorModel loginErrorModel;

  LoginException({
    required this.loginErrorModel,
  });
}

class ForgotPasswordException implements Exception {
  final ForgotPasswordErrorModel forgotPasswordErrorModel;

  ForgotPasswordException({
    required this.forgotPasswordErrorModel,
  });
}

class CheckOTPException implements Exception {
  final CheckOTPErrorModel checkOTPErrorModel;

  CheckOTPException({
    required this.checkOTPErrorModel,
  });
}

class CreateNewPasswordException implements Exception {
  final CreateNewPasswordErrorModel createNewPasswordErrorModel;

  CreateNewPasswordException({
    required this.createNewPasswordErrorModel,
  });
}

class ServerException implements Exception {}
