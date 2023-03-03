import 'package:wevr_app/features/authentication/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.status,
    required super.message,
    required super.id,
    required super.userName,
    required super.email,
    required super.phone,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['massage'],
      id: json['data']['id'],
      userName: json['data']['name'],
      email: json['data']['email'],
      phone: json['data']['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status' : status,
      'massage' : message,
      'id' : id,
      'name' : userName,
      'email' : email,
      'phone' : phone,
    };
  }
}
