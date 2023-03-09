import 'package:equatable/equatable.dart';
import 'package:wevr_app/features/authentication/domain/entities/check_otp.dart';

import '../../../domain/entities/forgot_password.dart';

abstract class OtpStates extends Equatable {
  const OtpStates();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpStates {}

class ForgotPasswordLoadingState extends OtpStates {}

class ForgotPasswordSuccessState extends OtpStates {
  final ForgotPassword forgotPassword;

  const ForgotPasswordSuccessState({required this.forgotPassword});
  @override
  List<Object> get props => [forgotPassword];
}

class ForgotPasswordErrorState extends OtpStates {
  final String error;
  const ForgotPasswordErrorState({required this.error});
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
