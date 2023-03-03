import '../../../../../../core/errors/network_exceptions.dart';

import '../../../../data/models/register_model/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates{}

class ChangeRegisterPasswordVisibilityState extends RegisterStates{}

class ChangeConfirmPasswordVisibilityState extends RegisterStates{}


// class RegisterLoadingState extends RegisterStates{}
// class RegisterSuccessState extends RegisterStates{
//   final RegisterModel registerModel;
//   RegisterSuccessState(this.registerModel);
// }
// class RegisterErrorState extends RegisterStates{
//   final NetworkExceptions networkExceptions;

//   RegisterErrorState(this.networkExceptions);
// }