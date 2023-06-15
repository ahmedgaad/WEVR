import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.status,
    required super.message,
    required super.token,
    required super.name,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'],
        message: json['massage'],
        token: json['data']['token'],
        name: json['data']['0']['name'],
      );
}
