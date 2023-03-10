// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class ForgotPassword extends Equatable {
  final int status;
  final String message;
  final int OTP;

  const ForgotPassword({
    required this.status,
    required this.message,
    required this.OTP,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        OTP,
      ];
}
