import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/service/injection_container.dart';
import 'package:wevr_app/core/utils/assets_manager.dart';
import 'package:wevr_app/core/utils/routes_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_cubit.dart';
import 'package:wevr_app/features/authentication/presentation/controller/OTP/otp_states.dart';

import '../../../../../core/utils/strings_manager.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(forgotPasswordUseCase: getIt()),
      child: BlocConsumer<OtpCubit, OtpStates>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccessState) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: StringsManager.info.tr(),
              text: state.forgotPassword.message,
              barrierDismissible: false,
              onConfirmBtnTap: () {
                navigateTo(
                  context,
                  Routes.resetEmailRoute,
                );
              },
              confirmBtnColor: Colors.amber,
              confirmBtnText: StringsManager.okay.tr(),
            );
          } else if (state is ForgotPasswordErrorState) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: StringsManager.error.tr(),
              text: state.error,
              confirmBtnText: StringsManager.okay.tr(),
            );
          }
        },
        builder: (context, state) {
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
                          StringsManager.forgot.tr(),
                          style: getBoldStylePoppins(),
                        ),
                        5.ph,
                        Text(
                          StringsManager.forgotPassDescription.tr(),
                        ),
                        SizedBox(
                          height: 50 / MediaQuery.of(context).devicePixelRatio,
                        ),
                        defaultFormField(
                          onSaved: (value) {
                            OtpCubit.get(context).email = value!;
                            print(OtpCubit.get(context).email);
                          },
                          label: StringsManager.enterYourEmail.tr(),
                          controller: OtpCubit.get(context).emailController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.emailError1.tr();
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return StringsManager.emailError2.tr();
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ConditionalBuilder(
                          condition: state is! ForgotPasswordLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                              function: () {
                                if (_emailKey.currentState!.validate()) {
                                  OtpCubit.get(context).forgotPassword();
                                }
                              },
                              text: StringsManager.continuee,
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
