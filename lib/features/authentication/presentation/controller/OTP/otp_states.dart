import 'package:equatable/equatable.dart';

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