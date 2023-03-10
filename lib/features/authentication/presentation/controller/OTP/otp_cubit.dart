import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/check_otp_usecase.dart';

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

  final TextEditingController firstCodeController = TextEditingController();
  final TextEditingController secondCodeController = TextEditingController();
  final TextEditingController thirdCodeController = TextEditingController();
  final TextEditingController fourthCodeController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> checkOTP({
    required String email,
  }) async {
    emit(CheckOTPLoadingState());
    final verificationCode = int.parse(firstCodeController.text +
        secondCodeController.text +
        thirdCodeController.text +
        fourthCodeController.text);
    final failureOrSendOTP = await checkOTPUseCase.call(
      pinCode: verificationCode,
      email: email,
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

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(ResetViaEmailLoadingState());

    final failureOrForgotPassword = await forgotPasswordUseCase.call(
      email: email,
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
