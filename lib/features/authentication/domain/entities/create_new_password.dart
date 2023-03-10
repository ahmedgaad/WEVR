import 'package:equatable/equatable.dart';

class CreateNewPassword extends Equatable {
  final int status;
  final String message;

  const CreateNewPassword({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
