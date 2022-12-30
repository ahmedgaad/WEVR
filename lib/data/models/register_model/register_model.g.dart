// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      status: json['status'] as int?,
      message: json['massage'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['password_confirmation'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      pinCode: json['pinCode'] as int?,
      pinTry: json['pinTry'] as int?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'massage': instance.message,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pinCode': instance.pinCode,
      'pinTry': instance.pinTry,
    };
