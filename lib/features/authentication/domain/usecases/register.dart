
 import '../../../../core/errors/api_result.dart';
import '../../data/models/register_model/register_model.dart';
import '../repository/users_repository.dart';

class RegisterUseCase{
  final UsersRepository usersRepository;

  RegisterUseCase(this.usersRepository);

  Future<ApiResult<RegisterModel>> call(RegisterModel registerModel) async{
    return await usersRepository.registerNewUser(registerModel);
  }
}