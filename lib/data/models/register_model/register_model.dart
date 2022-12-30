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
  //Null? emailVerifiedAt;
  String? phone;
  String? password;
  @JsonKey(name: "password_confirmation")
  String? confirmPassword;
  //Null? photo;
  //Null? rememberToken;
  String? createdAt;
  String? updatedAt;
  int? pinCode;
  int? pinTry;

  RegisterModel(
      {this.status,
        this.message,
        this.password,
        this.confirmPassword,
        this.id,
        this.name,
        this.email,
        //this.emailVerifiedAt,
        this.phone,
        //this.photo,
        //this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.pinCode,
        this.pinTry});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);


}