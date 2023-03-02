// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALIZATION = "assets/translations";

const Locale ARABIC_LOCALE = Locale("ar", "SA");
const Locale ENGLISH_LOCALE = Locale("en", "US");
//
// extension LanguageTypeExtension on LanguageType {
//   String getValue() {
//     switch (this) {
//       case LanguageType.ARABIC:
//         return ARABIC;
//       case LanguageType.ENGLISH:
//         return ENGLISH;
//     }
//   }
// }
