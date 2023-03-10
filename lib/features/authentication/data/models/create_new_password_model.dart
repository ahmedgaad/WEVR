import '../../domain/entities/create_new_password.dart';

class CreateNewPasswordModel extends CreateNewPassword {
  const CreateNewPasswordModel({
    required super.status,
    required super.message,
  });

  factory CreateNewPasswordModel.fromJson(Map<String, dynamic> json) =>
      CreateNewPasswordModel(
        status: json['status'],
        message: json['massage'],
      );
}
