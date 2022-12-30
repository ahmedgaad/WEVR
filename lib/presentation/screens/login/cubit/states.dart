import '../../../../core/errors/network_exceptions.dart';
import '../../../../data/models/login_model/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class ChangeLoginPasswordVisibilityState extends LoginStates{}


class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final LoginModel registerModel;
  LoginSuccessState(this.registerModel);
}
class LoginErrorState extends LoginStates{
  final NetworkExceptions networkExceptions;
  LoginErrorState(this.networkExceptions);
}






// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:wevr_app/core/errors/network_exceptions.dart';
//
// part 'states.freezed.dart';
// @freezed
// class ResultState<T> with _$ResultState<T>{
//   const factory ResultState.initial() = Initial<T>;
//   const factory ResultState.loading() = Loading<T>;
//   const factory ResultState.success(T data) = Success<T>;
//   const factory ResultState.change() = Change<T>;
//   const factory ResultState.error(NetworkExceptions networkExceptions) = Error<T>;
// }
