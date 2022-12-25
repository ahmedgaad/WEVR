import 'package:wevr_app/data/models/register_model/register_model.dart';

import '../../core/errors/api_result.dart';

abstract class UsersRepository{
  Future<ApiResult<RegisterModel>> registerNewUser(RegisterModel registerModel);
}