// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/errors/network_exceptions.dart';
import 'package:wevr_app/features/authentication/presentation/screens/login/cubit/states.dart';

import '../../../../data/models/login_model/login_model.dart';
import '../../../../domain/usecases/login.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUserUseCase;

  LoginCubit({
    required this.loginUserUseCase,
  }) : super(LoginInitialState());
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


  void userLogin(LoginModel loginModel) async{
    var response = await loginUserUseCase(loginModel);
    response.when(
        success: (LoginModel loginModel){
          emit(LoginSuccessState(loginModel));
        },
        failure: (NetworkExceptions networkExceptions){
          emit(LoginErrorState(networkExceptions));
        });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordVisibilityState());
  }

  //late LoginModel loginModel;

  /*void userLogin({
    required String email,
    required String password,
  }) async {

    emit(UserLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(SuccessLoginLoadingState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginLoadingState(error.toString()));
    });
  }*/
}
