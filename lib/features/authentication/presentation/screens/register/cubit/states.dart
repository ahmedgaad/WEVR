import 'package:equatable/equatable.dart';
import '../../../../domain/entities/register.dart';

abstract class RegisterStates extends Equatable {
  const RegisterStates();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterStates {}

class ChangeRegisterPasswordVisibilityState extends RegisterStates {}

class ChangeConfirmPasswordVisibilityState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final Register register;

  const RegisterSuccessState({required this.register});
  @override
  List<Object> get props => [register];
}

class RegisterErrorState extends RegisterStates {
  final String error;
  const RegisterErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
