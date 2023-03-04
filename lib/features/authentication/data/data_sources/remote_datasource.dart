import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wevr_app/core/errors/exceptions.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/authentication/data/models/register_model.dart';
import 'package:wevr_app/features/authentication/domain/entities/register.dart';

import '../../../../core/utils/constants_manager.dart';

abstract class AuthDataSource {
  Future<RegisterModel> register({
    required String userName,
    required String email,
    required String phone,
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
  }) async {
    try {
      final response = await dio.post(
        ConstantsManager.registerEP,
        data: json.encode({
          "name": userName,
          "email": email,
          "phone": phone,
        }),
      );
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.data.toString());
        final model = RegisterModel.fromJson(decodedData);
        return model;
      } else {
        throw ServerException();
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
