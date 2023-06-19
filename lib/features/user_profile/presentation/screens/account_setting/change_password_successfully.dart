import 'package:flutter/material.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/features/user_dashboard/presentation/screens/home/home_view.dart';

import '../../../../../core/components/success_screen.dart';

class ChangePasswordSuccessfully extends StatelessWidget {
  const ChangePasswordSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SuccessScreen(
              title: 'password reset successfully',
              subTitle:
              'you have successfully reset your password. Please use your new password when logging in',
            ),
            const Spacer(),
            defaultButton(
              function: () {
                navigatePush(context, const HomeView());
              },
              text: 'Continue exploring',
              width: 280.0,
              isUpperCase: false,
            ),
          ],
        ),
      ),
    );
  }
}
