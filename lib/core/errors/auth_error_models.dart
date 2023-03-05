import 'package:equatable/equatable.dart';

class RegisterErrorModel extends Equatable {
  final String errorMessage;

  const RegisterErrorModel({
    required this.errorMessage,
  });

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) {
    return RegisterErrorModel(
      errorMessage: json['massage'][0],
    );
  }
  @override
  List<Object?> get props => [errorMessage];
}
