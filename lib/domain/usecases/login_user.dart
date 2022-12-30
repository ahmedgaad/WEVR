import 'package:wevr_app/data/models/login_model/login_model.dart';
import 'package:wevr_app/domain/repository/users_repository.dart';

import '../../core/errors/api_result.dart';

class LoginUserUseCase{
  final UsersRepository usersRepository;

  LoginUserUseCase(this.usersRepository);

  Future<ApiResult<LoginModel>> call(LoginModel loginModel) async{
    return await usersRepository.loginUser(loginModel);
  }
}