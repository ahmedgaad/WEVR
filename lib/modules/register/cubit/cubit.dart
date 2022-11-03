import 'package:wevr_app/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterCubit extends Cubit<RegisterStates>{
   RegisterCubit ():super(RegisterInitialState());
   static RegisterCubit get(context) => BlocProvider.of(context);

   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var confirmPasswordController = TextEditingController();

   
}