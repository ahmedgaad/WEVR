import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../core/localization/change_locale.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../profile/build_divider.dart';

class RadioLang extends GetView<LocaleController> {
  const RadioLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 20, 60),
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              AssetsImagesManager.usIc,
              width: 30,
              height: 30,
              fit: BoxFit.scaleDown,
            ),
            title: const Text('English'),
            trailing: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return Radio(
                  value: 'en',
                  groupValue: controller.language!.languageCode,
                  onChanged: (val) {
                    setState(() {
                      controller.changeLocale(val!);
                    });
                  },
                );
              },
            ),
          ),
          const BuildDivider(),
          ListTile(
            leading: SvgPicture.asset(
              AssetsImagesManager.egIc,
              width: 32,
              height: 32,
              fit: BoxFit.scaleDown,
            ),
            title: const Text('Arabic'),
            trailing: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return Radio(
                  value: 'ar',
                  groupValue: controller.language!.languageCode,
                  onChanged: (val) {
                    setState(() {
                      controller.changeLocale(val!);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
