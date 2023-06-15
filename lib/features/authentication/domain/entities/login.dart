import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int status;
  final String message;
  final String name;
  final String token;

  const Login( {
    required this.status,
    required this.message,
    required this.token,
    required this.name,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        token,
      ];
}
