import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../widgets/language/radio_lang.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.changeLanguage.tr(),
          style: getBoldStylePoppins(),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsImagesManager.changeLang,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Text(
              AppStrings.pleaseSelectYourLang.tr(),
              style: getBoldStylePoppins(),
            ),
            const RadioLang(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: defaultButton(
                function: () {
                  Navigator.of(context).pop();
                },
                text: AppStrings.continuee.tr(),
                isUpperCase: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
