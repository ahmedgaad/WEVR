import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
            StringsManager.changeLanguage.tr,
            style: getBoldStylePoppins(),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
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
                  StringsManager.pleaseSelectYourLang.tr,
                  style: getBoldStylePoppins(),
                ),
                const RadioLang(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: defaultButton(
                    function: () {
                      Navigator.of(context).pop();
                    },
                    text: StringsManager.continuee.tr,
                    isUpperCase: false,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
