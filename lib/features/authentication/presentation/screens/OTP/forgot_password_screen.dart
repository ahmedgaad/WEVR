import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/service/service_locator_imports.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../controller/OTP/otp_cubit.dart';
import '../../controller/OTP/otp_states.dart';
import 'reset_via_email/reset_email_view.dart';

import '../../../../../core/utils/strings_manager.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  late String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OtpCubit(forgotPasswordUseCase: sl(), checkOTPUseCase: sl()),
      child: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          if (state is ResetViaEmailSuccessState) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: StringsManager.info.tr,
              text: state.forgotPassword.message,
              barrierDismissible: false,
              onConfirmBtnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResetEmailView(
                      email: email,
                    ),
                  ),
                );
              },
              confirmBtnColor: Colors.amber,
              confirmBtnText: StringsManager.okay.tr,
            );
          } else if (state is ResetViaEmailErrorState) {
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
          var cubit = OtpCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(DistancesManager.screenPadding),
                  child: Form(
                    key: _emailKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AssetsImagesManager.forgot),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Text(
                          StringsManager.forgot.tr,
                          style: getBoldStylePoppins(),
                        ),
                        5.ph,
                        Text(
                          StringsManager.forgotPassDescription.tr,
                        ),
                        SizedBox(
                          height: 50 / MediaQuery.of(context).devicePixelRatio,
                        ),
                        defaultFormField(
                          onSaved: (value) {
                            email = value!;
                          },
                          label: StringsManager.enterYourEmail.tr,
                          controller: emailController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.emailError1.tr;
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return StringsManager.emailError2.tr;
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ConditionalBuilder(
                          condition: state is! ResetViaEmailLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                              function: () {
                                if (_emailKey.currentState!.validate()) {
                                  _emailKey.currentState!.save();
                                  cubit.forgotPassword(email: email);
                                }
                              },
                              text: StringsManager.continuee.tr,
                            );
                          },
                          fallback: (BuildContext context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
