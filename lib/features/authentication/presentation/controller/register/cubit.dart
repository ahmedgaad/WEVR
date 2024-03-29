// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/register_usecase.dart';
import '../../../../../core/functions/debug_message.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/utils/constants.dart';
import 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({
    required this.registerUseCase,
  }) : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var userNameController = TextEditingController();

  IconData suffix = Icons.visibility;
  bool isPassword = true;
  bool isPasswordMatchCharacter = false;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangeRegisterPasswordVisibilityState());
  }

  IconData confirmSuffix = Icons.visibility;

  void changeSuffixPasswordVisibility() {
    isPassword = !isPassword;

    confirmSuffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangeConfirmPasswordVisibilityState());
  }

  Future<void> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoadingState());

    final failureOrRegister = await registerUseCase.call(
        userName: userName,
        email: email,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation);

    failureOrRegister.fold(
      (failure) => emit(RegisterErrorState(error: failure.message)),
      (register) {
        emit(RegisterSuccessState(register: register));
        // _saveToken(register.);
      },
    );
  }

  void _saveToken(String token) async {
    try {
      await CacheHelper.saveDataToCache(key: Constants.kToken, value: token);
      debugMessage('Barear Token $token', name: 'token');
    } on Exception catch (e) {
      debugMessage('Error while saving token $e', name: 'token');
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return StringsManager.SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return StringsManager.OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later";
    }
  }
}
