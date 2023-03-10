// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:wevr_app/features/authentication/presentation/controller/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase})
      : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var emailFormKey = GlobalKey<FormState>();
  var passFieldKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<String?> getDeviceInfo() async {
    //DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      print(androidInfo.device);
      return androidInfo.device;
    } else if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      print(iosInfo.name);
      return iosInfo.name;
    } else if (Platform.isWindows) {
      var windowsInfo = await DeviceInfoPlugin().windowsInfo;
      return windowsInfo.computerName;
    } else if (Platform.isMacOS) {
      var macOsInfo = await DeviceInfoPlugin().macOsInfo;
      return macOsInfo.computerName;
    } else if (Platform.isLinux) {
      var linuxInfo = await DeviceInfoPlugin().linuxInfo;
      return linuxInfo.name;
    } else {
      return "";
    }
  }

  

  Future<void> login({
    required String email,
    required String password,
    required String deviceInformation,
  }) async {
    emit(LoginLoadingState());

    final failureOrLogin = await loginUseCase.call(
      email: email,
      password: password,
      deviceInformation: deviceInformation,
    );

    failureOrLogin.fold(
      (failure) {
        emit(LoginErrorState(error: failure.message));
      },
      (login) {
        emit(LoginSuccessState(login: login));
        print(login.token);
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
