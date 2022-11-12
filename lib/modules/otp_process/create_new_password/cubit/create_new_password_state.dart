part of 'create_new_password_cubit.dart';

@immutable
abstract class CreateNewPasswordState {}

class CreateNewPasswordInitial extends CreateNewPasswordState {}

class ChangePasswordVisibilityState extends CreateNewPasswordState {}

class ConfirmSuccessState extends CreateNewPasswordState {}
class ConfirmFailState extends CreateNewPasswordState {}
