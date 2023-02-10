import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  int? status;
  @JsonKey(name: "massage")
  String? message;
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? token;
  @JsonKey(name: "device_name")
  String? deviceName;

  LoginModel(
      {this.status,
      this.message,
      this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.token,
      this.deviceName});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
