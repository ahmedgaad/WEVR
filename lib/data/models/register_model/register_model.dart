import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  int? status;
  String? massage;
  List<Data>? data;

  RegisterModel({
    this.status,
    this.massage,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

@JsonSerializable()
class Data {
  String? name;
  String? email;
  String? phone;
  int? pinCode;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({
    this.name,
    this.email,
    this.phone,
    this.pinCode,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
