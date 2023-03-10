// ignore_for_file: non_constant_identifier_names

import 'package:wevr_app/features/authentication/domain/entities/forgot_password.dart';

class ForgotPasswordModel extends ForgotPassword {
  const ForgotPasswordModel({
    required super.status,
    required super.message,
    required super.OTP,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json['status'],
        message: json['massage'],
        OTP: json['data']['OTP'],
      );
}
