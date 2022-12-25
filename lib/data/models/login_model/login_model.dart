import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.g.dart';
@JsonSerializable()
class LoginModel {
  int? status;
  String? massage;
  Data? data;

  LoginModel({this.status, this.massage, this.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class Data {
  UserInfo? userInfo;
  String? token;

  Data({this.userInfo, this.token});
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class UserInfo {
  int? id;
  String? name;
  String? email;
  //Null? emailVerifiedAt;
  String? phone;
  //Null? photo;
  String? createdAt;
  String? updatedAt;
  int? pinCode;

  UserInfo(
      {this.id,
        this.name,
        this.email,
        //this.emailVerifiedAt,
        this.phone,
        //this.photo,
        this.createdAt,
        this.updatedAt,
        this.pinCode});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
