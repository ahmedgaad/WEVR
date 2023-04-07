import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../helpers/cache_helper.dart';

class LocaleController extends GetxController {
  Locale? language;

  void changeLocale(String languageCode) {
    Locale locale = Locale(languageCode);
    CacheHelper.saveDataToCache(key: 'lang', value: languageCode);
    Get.updateLocale(locale);
    language = locale;
  }

  @override
  void onInit() {
    final sharedPrefLang = CacheHelper.getDataFromCache(key: 'lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
