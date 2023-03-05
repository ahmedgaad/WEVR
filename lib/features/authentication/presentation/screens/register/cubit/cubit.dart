// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/register_usecase.dart';
import 'states.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

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
      (failure) =>
          emit(RegisterErrorState(error: _mapFailureToMessage(failure))),
      (register) => emit(RegisterSuccessState(register: register)),
    );
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
