// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/presentation/screens/login/cubit/states.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../../../../data/models/login_model.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailFormKey = GlobalKey<FormState>();
  var passFieldKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangePasswordVisibilityState());
  }

  late LoginModel loginModel;

  void userLogin({
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
  }
}
