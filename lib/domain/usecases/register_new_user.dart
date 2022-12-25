import 'package:wevr_app/domain/repository/users_repository.dart';

import '../../core/errors/api_result.dart';
import '../../data/models/register_model/register_model.dart';

class RegisterNewUserUseCase{
  final UsersRepository usersRepository;

  RegisterNewUserUseCase(this.usersRepository);

  Future<ApiResult<RegisterModel>> call(RegisterModel registerModel) async{
    return await usersRepository.registerNewUser(registerModel);
  }
}