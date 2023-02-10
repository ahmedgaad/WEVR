import 'package:wevr_app/core/errors/api_result.dart';
import 'package:wevr_app/core/errors/network_exceptions.dart';
 import 'package:wevr_app/features/authentication/data/data_sources/remote_data_source/web_services.dart';
import 'package:wevr_app/features/authentication/data/models/login_model/login_model.dart';
import 'package:wevr_app/features/authentication/data/models/register_model/register_model.dart';

import '../../domain/repository/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final WebService webService;

  UsersRepositoryImpl(this.webService);
  @override
  Future<ApiResult<RegisterModel>> registerNewUser(
      RegisterModel registerModel) async {
    try {
      var response = await webService.register(registerModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<LoginModel>> loginUser(LoginModel loginModel) async {
    try {
      var response = await webService.login(loginModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> logout(String token) async{
    try {
      var response = await webService.logout(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
  
}
