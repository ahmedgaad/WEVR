import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wevr_app/core/errors/auth_error_models.dart';
import 'package:wevr_app/features/authentication/data/models/check_otp_model.dart';
import 'package:wevr_app/features/authentication/data/models/forgot_password_model.dart';
import 'package:wevr_app/features/authentication/data/models/login_model.dart';
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

  Future<LoginModel> login({
    required String email,
    required String password,
    required String deviceInformation,
  });

  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  });

  Future<CheckOTPModel> checkOTP({
    required String email,
    required int pinCode,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(
        seconds: 20 * 1000,
      ),
      sendTimeout: const Duration(
        seconds: 20 * 1000,
      ),
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
        data: json.encode(
          {
            "name": userName,
            "email": email,
            "phone": phone,
            "password": password,
            "password_confirmation": passwordConfirmation
          },
        ),
      );
      if (response.data['status'] == 1) {
        //final decodedData = json.decode(response.data.toString());
        final model = RegisterModel.fromJson(response.data);
        print(model);
        return model;
      } else {
        throw RegisterException(
            registerErrorModel: RegisterErrorModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
    required String deviceInformation,
  }) async {
    try {
      final response = await dio.post(
        ConstantsManager.loginEP,
        data: json.encode(
          {
            'email': email,
            'password': password,
            'device_name': deviceInformation,
          },
        ),
      );
      if (response.data['status'] == 1) {
        final model = LoginModel.fromJson(response.data);
        //print(model);
        return model;
      } else {
        throw LoginException(
            loginErrorModel: LoginErrorModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await dio.post(
        ConstantsManager.resetViaEmailEP,
        data: json.encode(
          {
            'email': email,
          },
        ),
      );
      if (response.data['status'] == 1) {
        final model = ForgotPasswordModel.fromJson(response.data);
        print(model);
        return model;
      } else {
        throw ForgotPasswordException(
            forgotPasswordErrorModel:
                ForgotPasswordErrorModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CheckOTPModel> checkOTP({
    required String email,
    required int pinCode,
  }) async {
    try {
      final response = await dio.post(
        ConstantsManager.checkOTPEP,
        data: {
          'email': email,
          'pin_code': pinCode,
        },
      );
      if (response.data['status'] == 1) {
        final model = CheckOTPModel.fromJson(response.data);
        print(model);
        return model;
      } else {
        throw CheckOTPException(
            checkOTPErrorModel: CheckOTPErrorModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }
}
