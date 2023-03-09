import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/forgot_password_usecase.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  OtpCubit({required this.forgotPasswordUseCase}) : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(ForgotPasswordLoadingState());

    final failureOrForgotPassword = await forgotPasswordUseCase.call(
      email: email,
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
