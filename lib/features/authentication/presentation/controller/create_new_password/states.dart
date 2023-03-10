part of 'cubit.dart';

@immutable
abstract class CreateNewPasswordStates {
  const CreateNewPasswordStates();

  @override
  List<Object> get props => [];
}

class CreateNewPasswordInitial extends CreateNewPasswordStates {}

class ChangePasswordVisibilityState extends CreateNewPasswordStates {}

class CreateNewPasswordLoadingState extends CreateNewPasswordStates {}

class CreateNewPasswordSuccessState extends CreateNewPasswordStates {
  final CreateNewPassword createNewPassword;

  const CreateNewPasswordSuccessState({required this.createNewPassword});

  @override
  List<Object> get props => [createNewPassword];
}

class CreateNewPasswordErrorState extends CreateNewPasswordStates {
  final String error;
  const CreateNewPasswordErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
