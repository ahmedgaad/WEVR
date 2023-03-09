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

  final TextEditingController firstCodeController = TextEditingController();
  final TextEditingController secondCodeController = TextEditingController();
  final TextEditingController thirdCodeController = TextEditingController();
  final TextEditingController fourthCodeController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> checkOTP() async {
    emit(CheckOTPLoadingState());
    final verificationCode = int.parse(firstCodeController.text +
        secondCodeController.text +
        thirdCodeController.text +
        fourthCodeController.text);
    final failureOrSendOTP = await checkOTPUseCase.call(
      //TODO: save otp form user
      pinCode: verificationCode,
      email: 'agad92998@gmail.com',
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
        emit(ResetViaEmailErrorState(error: failure.message));
      },
      (forgotPass) {
        emit(ResetViaEmailSuccessState(forgotPassword: forgotPass));
      },
    );
  }
}
