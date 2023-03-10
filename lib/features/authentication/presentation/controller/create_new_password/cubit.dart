// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/authentication/domain/entities/create_new_password.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/create_new_password.dart';

part 'states.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordStates> {
  final CreateNewPasswordUseCase createNewPasswordUseCase;

  CreateNewPasswordCubit({required this.createNewPasswordUseCase})
      : super(CreateNewPasswordInitial());
  static CreateNewPasswordCubit get(context) => BlocProvider.of(context);
  var passFormKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  IconData suffix = Icons.visibility;
  bool isPassword = true;
  bool isPasswordMatchCharacter = false;

  void ChangePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangePasswordVisibilityState());
  }

  Future<void> createNewPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(CreateNewPasswordLoadingState());

    final failureOrCreateNewPassword = await createNewPasswordUseCase.call(
      password: password,
      passwordConfirmation: passwordConfirmation,
      email: email,
    );

    failureOrCreateNewPassword.fold(
      (failure) {
        emit(CreateNewPasswordErrorState(error: failure.message));
      },
      (createNewPassword) {
        emit(CreateNewPasswordSuccessState(
            createNewPassword: createNewPassword));
      },
    );
  }
}
