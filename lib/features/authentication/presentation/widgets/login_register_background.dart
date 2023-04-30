import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../../core/utils/values_manager.dart';

class LoginRegisterBackground extends StatelessWidget {
  const LoginRegisterBackground(
      {Key? key,
      required this.textButton,
      required this.questionText,
      required this.route,
      required this.p1,
      required this.p2})
      : super(key: key);

  final String textButton;
  final String questionText;
  final String route;
  final double p1;
  final double p2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: AppSize.s2.toInt(),
        child: Container(
          decoration: const BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppRadius.r93),
              bottomRight: Radius.circular(AppRadius.r93),
            ),
          ),
        ),
      ),
      Expanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    questionText,
                    style: getRegularStyleInter(
                      color: ColorManager.darkGrey,
                      fontSize: AppSize.s16.sp,
                    ),
                  ),
                  defaultTextButton(
                      textColor: ColorManager.primary,
                      text: textButton,
                      onPressed: () {
                        navigateTo(context, route);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
