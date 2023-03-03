// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/core/dependency_injection/injection_container.dart';
import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'package:wevr_app/core/utils/constants_manager.dart';
import 'package:wevr_app/features/authentication/presentation/screens/register/register_successfully.dart';
import 'package:wevr_app/features/authentication/presentation/widgets/login/form_column.dart';
import 'package:wevr_app/features/authentication/presentation/widgets/register/register_form.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../data/models/register_model/register_model.dart';
import '../../widgets/login_register_background.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return BlocProvider(
      create: (BuildContext context) =>
          RegisterCubit(registerNewUserUseCase: getIt()),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          // if (state is RegisterSuccessState) {
          //   if (state.registerModel.status != null) {
          //     print(state.registerModel.message);
          //     print(state.registerModel.token);

          //     CacheHelper.saveData(
          //             key: 'token', value: state.registerModel.token)
          //         .then((value) {
          //       ConstantsManager.token = state.registerModel.token!;
          //       Navigator.pushReplacementNamed(
          //           context, Routes.registerSuccessRoute);
          //     });
          //   }
          // }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: Stack(
              alignment: Alignment.center,
              children: [
                LoginRegisterBackground(
                  buttonText: AppStrings.signIn.tr(),
                  route: Routes.loginRoute,
                  questionText: AppStrings.alreadyHaveAccount.tr(),
                  p1: PaddingSize.p60,
                  p2: PaddingSize.p24,
                ),
                Material(
                  borderRadius: BorderRadius.circular(AppRadius.r41),
                  elevation: AppSize.s8,
                  color: ColorManager.transparent,
                  child: Container(
                    height: AppSize.s700.h,
                    width: AppSize.s300.w,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppRadius.r41),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              backButton(function: () {}),
                              SizedBox(
                                height: AppSize.s2.h,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SocialColumn(
                                          firstText: AppStrings.signUp.tr(),
                                          secondText:
                                              AppStrings.registerWord.tr(),
                                        ),
                                        const RegisterForm(),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: ConditionalBuilder(
                                              condition: state != null,
                                              builder: (BuildContext context) {
                                                return defaultButton(
                                                  function: () async {
                                                    // if (formKey.currentState!
                                                    //     .validate()) {
                                                    //   cubit.userRegister(
                                                    //       RegisterModel(
                                                    //     name: cubit
                                                    //         .userNameController
                                                    //         .text,
                                                    //     email: cubit
                                                    //         .emailController
                                                    //         .text,
                                                    //     phone: cubit
                                                    //         .phoneController
                                                    //         .text,
                                                    //     password: cubit
                                                    //         .passwordController
                                                    //         .text,
                                                    //     confirmPassword: cubit
                                                    //         .confirmPasswordController
                                                    //         .text,
                                                    //     deviceName: await cubit
                                                    //         .getDeviceInfo(),
                                                    //   ));
                                                    // }
                                                    navigatePush(context,
                                                        const RegisterSuccessfully());
                                                  },
                                                  text: AppStrings.signUp.tr(),
                                                  width: AppSize.s200.w,
                                                  height: AppSize.s44.h,
                                                  isUpperCase: false,
                                                );
                                              },
                                              fallback: (BuildContext context) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
