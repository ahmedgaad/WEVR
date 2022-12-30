// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      status: json['status'] as int?,
      message: json['massage'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['password_confirmation'] as String?,
      phone: json['phone'] as String?,
      token: json['token'] as String?,
      deviceName: json['device_name'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'massage': instance.message,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'phone': instance.phone,
      'token': instance.token,
      'device_name': instance.deviceName,
    };
