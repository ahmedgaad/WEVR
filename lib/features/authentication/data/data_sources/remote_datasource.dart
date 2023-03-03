import 'package:wevr_app/core/helpers/dio_helper.dart';
import 'package:wevr_app/core/utils/constants_manager.dart';
import 'package:wevr_app/features/authentication/data/models/register_model.dart';

abstract class RemoteDataSource {
  Future<RegisterModel> register();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<RegisterModel> register(RegisterModel registerModel) async {
    var response = await DioHelper.postData(
      url: ConstantsManager.registerEP,
      data: {
        'name': registerModel.userName,
        'email': registerModel.email,
        'phone': registerModel.phone,
      },
    );
    print(response);
    return RegisterModel.fromJson(response.data);
  }
}
