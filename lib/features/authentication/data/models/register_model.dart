import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    super.status,
    super.message,
    super.id,
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
      'status': status,
      'massage': message,
      'id': id,
      'name': userName,
      'email': email,
      'phone': phone,
    };
  }
}
