import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int status;
  final String message;
  final Data data;

  const Login({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class Data extends Equatable {
  final User user;
  final String token;

  const Data({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [
        user,
        token,
      ];
}

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
      ];
}
