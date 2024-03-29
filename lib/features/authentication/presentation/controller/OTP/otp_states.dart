import 'package:equatable/equatable.dart';
import '../../../domain/entities/check_otp.dart';

import '../../../domain/entities/forgot_password.dart';

abstract class OtpStates extends Equatable {
  const OtpStates();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpStates {}

class ResetViaEmailLoadingState extends OtpStates {}

class ResetViaEmailSuccessState extends OtpStates {
  final ForgotPassword forgotPassword;

  const ResetViaEmailSuccessState({required this.forgotPassword});
  @override
  List<Object> get props => [forgotPassword];
}

class ResetViaEmailErrorState extends OtpStates {
  final String error;
  const ResetViaEmailErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class CheckOTPLoadingState extends OtpStates {}

class CheckOTPSuccessState extends OtpStates {
  final CheckOTP checkOTP;
  const CheckOTPSuccessState({
    required this.checkOTP,
  });
  @override
  List<Object> get props => [CheckOTP];
}

class CheckOTPErrorState extends OtpStates {
  final String error;
  const CheckOTPErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
