import 'package:flutter/material.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';
import 'package:wevr_app/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        title: const Text('login',
        style: TextStyle(
          color: ColorManager.error
        ),),
      ),
    );
  }
}
