import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/logout_model.dart';
import '../../../../core/errors/auth_error_models.dart';
import '../models/check_otp_model.dart';
import '../models/create_new_password_model.dart';
import '../models/forgot_password_model.dart';
import '../models/login_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/register_model.dart';
import '../../../../core/utils/constants.dart';

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

  Future<LogoutModel> logout({
    required String token,
  });

  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  });

  Future<CheckOTPModel> checkOTP({
    required String email,
    required int pinCode,
  });

  Future<CreateNewPasswordModel> createNewPassword({
    required String password,
    required String passwordConfirmation,
    required String email,
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
      baseUrl: Constants.baseURL,
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
        Constants.registerEP,
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
        Constants.loginEP,
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
        Constants.resetViaEmailEP,
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
        Constants.checkOTPEP,
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

  @override
  Future<CreateNewPasswordModel> createNewPassword({
    required String password,
    required String passwordConfirmation,
    required String email,
  }) async {
    try {
      final response = await dio.post(
        Constants.newPasswordEP,
        data: {
          'email': email,
          'password': password,
          'confirmation_password': passwordConfirmation,
        },
      );
      if (response.data['status'] == 1) {
        final model = CreateNewPasswordModel.fromJson(response.data);
        print(model);
        return model;
      } else {
        throw CreateNewPasswordException(
            createNewPasswordErrorModel:
                CreateNewPasswordErrorModel.fromJson(response.data));
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LogoutModel> logout({
    required String token,
  }) async {
    try {
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await dio.delete(
        Constants.logoutEP,
        options: Options(headers: headers),
      );
      if (response.data['status'] == 201) {
        final model = LogoutModel.fromJson(response.data);
        print(model);
        return model;
      } else {
        throw ServerException();
      }
    } on DioError catch (e) {
      throw ServerException();
    }
  }
}
