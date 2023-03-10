import 'package:equatable/equatable.dart';

class CheckOTP extends Equatable {
  final int status;
  final String message;

  const CheckOTP({required this.status, required this.message});

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
