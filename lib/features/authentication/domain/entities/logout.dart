import 'package:equatable/equatable.dart';

class Logout extends Equatable {
  final int status;
  final String message;

  const Logout({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
