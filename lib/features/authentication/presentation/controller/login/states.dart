import 'package:equatable/equatable.dart';
import 'package:wevr_app/features/authentication/domain/entities/forgot_password.dart';
import 'package:wevr_app/features/authentication/domain/entities/login.dart';

abstract class LoginStates extends Equatable {
  const LoginStates();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginStates {}

class ChangeLoginPasswordVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final Login login;

  const LoginSuccessState({required this.login});
  @override
  List<Object> get props => [login];
}

class LoginErrorState extends LoginStates {
  final String error;
  const LoginErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

