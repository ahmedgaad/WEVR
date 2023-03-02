import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model_error.g.dart';

@JsonSerializable()
class RegisterModelError {
  int? status;
  String? massage;
  Data? data;

  RegisterModelError({this.status, this.massage, this.data,});

  factory RegisterModelError.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelErrorFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelErrorToJson(this);
}

@JsonSerializable()
class Data {
  List<String>? email;
  List<String>? name;
  List<String>? password;
  List<String>? phone;

  Data({this.email,});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
