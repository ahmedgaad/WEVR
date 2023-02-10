import 'dart:io';


 import '../../../../core/errors/api_result.dart';
import '../../data/models/login_model/login_model.dart';
import '../../data/models/register_model/register_model.dart';

abstract class UsersRepository{
  Future<ApiResult<RegisterModel>> registerNewUser(RegisterModel registerModel);
  Future<ApiResult<LoginModel>> loginUser(LoginModel loginModel);
  Future<ApiResult<dynamic>> logout(String token);
}