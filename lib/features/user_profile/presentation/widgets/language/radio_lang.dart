import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/languages_manager.dart';

import '../profile/build_divider.dart';

class RadioLang extends StatefulWidget {
  const RadioLang({super.key});

  @override
  State<RadioLang> createState() => _RadioLangState();
}

class _RadioLangState extends State<RadioLang> {
  String? selectedLang;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 80, 20, 120),
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
            trailing: Radio(
              value: ENGLISH_LOCALE,
              groupValue: selectedLang,
              onChanged: (val) {
                setState(() {});
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
            trailing: Radio(
              value: ENGLISH_LOCALE,
              groupValue: selectedLang,
              onChanged: (val) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
