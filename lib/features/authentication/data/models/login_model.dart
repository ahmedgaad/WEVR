import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'],
      message: json['massage'],
      data: DataModel.fromJson(json['data']));
}

class DataModel extends Data {
  const DataModel({
    required super.user,
    required super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        user: UserModel.fromJson(json['0']),
        token: json['token'],
      );
}

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
      );
}
