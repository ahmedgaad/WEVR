// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/errors/network_exceptions.dart';
  import '../../../../data/models/register_model/register_model.dart';
import '../../../../domain/usecases/register.dart';
import 'states.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase registerNewUserUseCase;

  RegisterCubit({
    required this.registerNewUserUseCase,
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

  void userRegister(RegisterModel registerModel) async{
    var response = await registerNewUserUseCase(registerModel);
    response.when(
        success: (RegisterModel registerModel){
          emit(RegisterSuccessState(registerModel));
        },
        failure: (NetworkExceptions networkExceptions){
          emit(RegisterErrorState(networkExceptions));
        });
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
}