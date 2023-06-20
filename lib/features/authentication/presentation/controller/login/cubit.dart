import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/core/functions/debug_message.dart';
import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'package:wevr_app/core/helpers/get_device_info_helper.dart';
import 'package:wevr_app/features/authentication/domain/use_cases/login_usecase.dart';
import 'package:wevr_app/features/authentication/presentation/controller/login/states.dart';

import '../../../../../core/utils/constants.dart';

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
      (login) {
        emit(LoginSuccessState(login: login));
        _saveToken(login.data.token);
      },
    );
  }

  void _saveToken(String token) async {
    try {
      await CacheHelper.saveDataToCache(key: Constants.kToken, value: token);
      debugMessage('Bearer Token $token', name: 'token');
      Constants.userToken = CacheHelper.getDataFromCache(key: Constants.kToken);
    } on Exception catch (e) {
      debugMessage('Error while saving token $e', name: 'token');
    }
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangeLoginPasswordVisibilityState());
  }
}
