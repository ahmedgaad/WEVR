// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit() : super(CreateNewPasswordInitial());
  static CreateNewPasswordCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
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

  void ShowSuffixSuccess() {
    if (passwordController.text == confirmPasswordController.text) {}
  }
}
