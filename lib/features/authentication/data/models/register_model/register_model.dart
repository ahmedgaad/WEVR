import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  int? status;
  @JsonKey(name: "massage")
  String? message;
  int? id;
  String? name;
  String? email;
  String? password;
  @JsonKey(name: "password_confirmation")
  String? confirmPassword;
  String? phone;
  String? token;
  @JsonKey(name: "device_name")
  String? deviceName;

  RegisterModel({
    this.status,
    this.message,
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.token,
    this.deviceName,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
