import 'dart:io';

import 'package:wevr_app/domain/repository/users_repository.dart';
import '../../core/errors/api_result.dart';

class LogoutUseCase{
  final UsersRepository usersRepository;
  LogoutUseCase(this.usersRepository);

  Future<ApiResult<dynamic>> call(String token) async{
    return await usersRepository.logout(token);
  }
}