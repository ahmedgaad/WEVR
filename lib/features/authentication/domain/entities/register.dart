import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final int status;
  final String message;
  final int id;
  final String userName;
  final String email;
  final String phone;

  const Register({
    required this.status,
    required this.message,
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        id,
        userName,
        email,
        phone,
      ];
}
