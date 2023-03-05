import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wevr_app/core/errors/auth_error_models.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../models/register_model.dart';
import '../../domain/entities/register.dart';

import '../../../../core/utils/constants_manager.dart';

abstract class AuthDataSource {
  Future<RegisterModel> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ConstantsManager.baseURL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  @override
  Future<RegisterModel> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await dio.post(
        ConstantsManager.registerEP,
        data: json.encode({
          "name": userName,
          "email": email,
          "phone": phone,
          "password": password,
          "password_confirmation": passwordConfirmation
        }),
      );
      if (response.data['status'] == 1) {
        //final decodedData = json.decode(response.data.toString());
        final model = RegisterModel.fromJson(response.data);
        print(model);
        return model;
      } else {
        throw 
        RegisterException(registerErrorModel: RegisterErrorModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }
}






















// import 'package:wevr_app/core/helpers/dio_helper.dart';
// import 'package:wevr_app/core/utils/constants_manager.dart';
// import 'package:wevr_app/features/authentication/data/models/register_model.dart';

// abstract class RemoteDataSource {
//   Future<RegisterModel> register();
// }

// class RemoteDataSourceImpl implements RemoteDataSource {
//   @override
//   Future<RegisterModel> register(RegisterModel registerModel) async {
//     var response = await DioHelper.postData(
//       url: ConstantsManager.registerEP,
//       data: {
//         'name': registerModel.userName,
//         'email': registerModel.email,
//         'phone': registerModel.phone,
//       },
//     );
//     print(response);
//     return RegisterModel.fromJson(response.data);
//   }
// }
