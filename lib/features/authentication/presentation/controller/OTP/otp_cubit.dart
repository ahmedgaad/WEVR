import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/check_otp_usecase.dart';

import '../../../domain/use_cases/forgot_password_usecase.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final CheckOTPUseCase checkOTPUseCase;
  OtpCubit({
    required this.checkOTPUseCase,
    required this.forgotPasswordUseCase,
  }) : super(OtpInitial());
  static OtpCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  //TODO: save email from forgot pass screen to use in otp screen when click on Resend button
  String email = '';

  Future<void> checkOTP() async {
    emit(CheckOTPLoadingState());

    final failureOrSendOTP = await checkOTPUseCase.call(
      //TODO: save otp form user
      pinCode: 12,
      email: emailController.text,
    );

    failureOrSendOTP.fold(
      (failure) {
        emit(CheckOTPErrorState(error: failure.message));
      },
      (sendOTP) {
        emit(CheckOTPSuccessState(checkOTP: sendOTP));
      },
    );
  }

  Future<void> forgotPassword() async {
    emit(ForgotPasswordLoadingState());

    final failureOrForgotPassword = await forgotPasswordUseCase.call(
      email: emailController.text,
    );

    failureOrForgotPassword.fold(
      (failure) {
        emit(ForgotPasswordErrorState(error: failure.message));
      },
      (forgotPass) {
        emit(ForgotPasswordSuccessState(forgotPassword: forgotPass));
      },
    );
  }
}
