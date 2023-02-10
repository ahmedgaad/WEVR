import 'dart:io';

import '../../../../core/errors/api_result.dart';
import '../repository/users_repository.dart';



class LogoutUseCase{
  final UsersRepository usersRepository;
  LogoutUseCase(this.usersRepository);

  Future<ApiResult<dynamic>> call(String token) async{
    return await usersRepository.logout(token);
  }
}