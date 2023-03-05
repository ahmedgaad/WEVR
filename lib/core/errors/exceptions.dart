import 'package:wevr_app/core/errors/auth_error_models.dart';

class OfflineException implements Exception {}

class RegisterException implements Exception {
  final RegisterErrorModel registerErrorModel;
  RegisterException({
    required this.registerErrorModel,
  });
}

class ServerException implements Exception {}
