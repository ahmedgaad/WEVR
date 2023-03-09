import 'package:wevr_app/features/authentication/domain/entities/check_otp.dart';

class CheckOTPModel extends CheckOTP {
  const CheckOTPModel({
    required super.status,
    required super.message,
  });

  factory CheckOTPModel.fromJson(Map<String, dynamic> json) => CheckOTPModel(
        status: json['status'],
        message: json['massage'],
      );
}
