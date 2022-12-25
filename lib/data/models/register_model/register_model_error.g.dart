// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModelError _$RegisterModelErrorFromJson(Map<String, dynamic> json) =>
    RegisterModelError(
      status: json['status'] as int?,
      massage: json['massage'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterModelErrorToJson(RegisterModelError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'massage': instance.massage,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
    )
      ..name =
          (json['name'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..password =
          (json['password'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..phone =
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'phone': instance.phone,
    };
