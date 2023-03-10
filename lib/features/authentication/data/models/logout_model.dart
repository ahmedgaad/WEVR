import '../../domain/entities/logout.dart';

class LogoutModel extends Logout {
  const LogoutModel({
    required super.status,
    required super.message,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        status: json['status'],
        message: json['massage'],
      );
}
