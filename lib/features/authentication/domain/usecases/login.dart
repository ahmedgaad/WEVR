

import '../../../../core/errors/api_result.dart';
import '../../data/models/login_model/login_model.dart';
import '../repository/users_repository.dart';

class LoginUseCase{
  final UsersRepository usersRepository;

  LoginUseCase(this.usersRepository);

  Future<ApiResult<LoginModel>> call(LoginModel loginModel) async{
    return await usersRepository.loginUser(loginModel);
  }
}