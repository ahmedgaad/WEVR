import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model_error.g.dart';

@JsonSerializable()
class LoginModelError {
  int? status;
  String? massage;
  String? data;

  LoginModelError({this.status, this.massage, this.data});

  factory LoginModelError.fromJson(Map<String, dynamic> json) =>
      _$LoginModelErrorFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelErrorToJson(this);
}
