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

class LoginErrorModel extends Equatable {
  final String errorMessage;

  const LoginErrorModel({
    required this.errorMessage,
  });

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      LoginErrorModel(errorMessage: json['massage']);
  @override
  List<Object?> get props => [errorMessage];
}

class ForgotPasswordErrorModel extends Equatable {
  final String errorMessage;
  const ForgotPasswordErrorModel({required this.errorMessage});
  factory ForgotPasswordErrorModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordErrorModel(
        errorMessage: json['massage'],
      );
  @override
  List<Object?> get props => [errorMessage];
}

class CheckOTPErrorModel extends Equatable {
  final String errorMessage;

  const CheckOTPErrorModel({required this.errorMessage});

  factory CheckOTPErrorModel.fromJson(Map<String, dynamic> json) =>
      CheckOTPErrorModel(
        errorMessage: json['massage'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
