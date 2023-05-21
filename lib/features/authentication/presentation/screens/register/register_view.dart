// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:wevr_app/core/service/service_locator.dart';
import 'package:wevr_app/features/authentication/presentation/screens/register/register_successfully.dart';
import 'package:wevr_app/features/authentication/presentation/widgets/login/form_column.dart';
import 'package:wevr_app/features/authentication/presentation/widgets/register/register_form.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../introduction/presentation/screens/get_started/get_started_view.dart';
import '../../widgets/login_register_background.dart';
import '../../controller/register/cubit.dart';
import '../../controller/register/states.dart';
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
    return BlocProvider.value(
      value: locator<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            navigatePush(context, const RegisterSuccessfully());
          } else if (state is RegisterErrorState) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: StringsManager.error.tr,
              text: state.error,
              confirmBtnText: StringsManager.okay.tr,
              confirmBtnColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                LoginRegisterBackground(
                  textButton: StringsManager.signIn.tr,
                  route: Routes.loginRoute,
                  questionText: StringsManager.alreadyHaveAccount.tr,
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
                              backButton(function: (){
                                navigatePush(context, const GetStartedView());
                              }),
                              // backButton(function: () {}),
                              // SizedBox(
                              //   height: AppSize.s2.h,
                              // ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        20.ph,
                                        Text(
                                          StringsManager.signUp.tr,
                                          style: getSemiBoldStylePoppins(
                                            color: ColorManager.primary,
                                            fontSize: 16.sp,
                                          ),),
                                        const SocialColumn(
                                            // firstText: AppStrings.signUp.tr,
                                            // secondText:
                                            //     AppStrings.registerWord.tr,
                                            ),
                                        const RegisterForm(),
                                        // 15.ph,

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: ConditionalBuilder(
                                    condition: state
                                    is! RegisterLoadingState,
                                    builder: (BuildContext context) {
                                      return defaultButton(
                                        function: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.register(
                                              userName: cubit
                                                  .userNameController
                                                  .text,
                                              email: cubit
                                                  .emailController
                                                  .text,
                                              phone: cubit
                                                  .phoneController
                                                  .text,
                                              password: cubit
                                                  .passwordController
                                                  .text,
                                              passwordConfirmation: cubit
                                                  .confirmPasswordController
                                                  .text,
                                            );
                                          }
                                        },
                                        text:
                                        StringsManager.signUp.tr,
                                        width: AppSize.s162.w,
                                        height: 48.h,
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
                              30.ph,
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
