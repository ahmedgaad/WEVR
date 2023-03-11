// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'package:wevr_app/core/helpers/get_device_info_helper.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:wevr_app/features/authentication/presentation/controller/login/states.dart';

import '../../../../../core/utils/constants_manager.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginCubit({
    required this.loginUseCase,
  }) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var emailFormKey = GlobalKey<FormState>();
  var passFieldKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login({
    required String email,
    required String password,
    // required String deviceInformation,
  }) async {
    emit(LoginLoadingState());
    await CacheHelper.saveDataToCache(key: 'isGuest', value: false);
    String deviceInfo = (await getDeviceInfo()) ?? "Unknown device";
    final failureOrLogin = await loginUseCase.call(
      email: email,
      password: password,
      deviceInformation: deviceInfo,
    );

    failureOrLogin.fold(
      (failure) {
        emit(LoginErrorState(error: failure.message));
      },
      (login) async {
        emit(LoginSuccessState(login: login));
        print(login.token);
        await CacheHelper.saveDataToCache(key: 'userToken', value: login.token);
        ConstantsManager.userToken =
            CacheHelper.getDataFromCache(key: 'userToken');
      },
    );
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordVisibilityState());
  }
}
