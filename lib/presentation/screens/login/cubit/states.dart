import '../../../../data/models/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class ChangePasswordVisibilityState extends LoginStates{}

class UserLoginLoadingState extends LoginStates{

}
class SuccessLoginLoadingState extends LoginStates{
  final LoginModel loginModel;

  SuccessLoginLoadingState(this.loginModel);
}
class ErrorLoginLoadingState extends LoginStates{

  late final String error;

  ErrorLoginLoadingState(this.error);
}