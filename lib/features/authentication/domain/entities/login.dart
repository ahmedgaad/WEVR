import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int status;
  final String message;
  final String token;

  const Login({
    required this.status,
    required this.message,
    required this.token,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        token,
      ];
}
