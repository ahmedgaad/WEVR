import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getMediumStylePoppins(
        fontSize: AppSize.s20,
        color: ColorManager.smokyGray,
      ),
    );
  }
}
