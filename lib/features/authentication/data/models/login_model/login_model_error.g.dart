// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModelError _$LoginModelErrorFromJson(Map<String, dynamic> json) =>
    LoginModelError(
      status: json['status'] as int?,
      massage: json['massage'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$LoginModelErrorToJson(LoginModelError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'massage': instance.massage,
      'data': instance.data,
    };
