import 'package:wevr_app/core/helpers/cache_helper.dart';
import 'package:wevr_app/core/utils/constants.dart';

import 'debug_message.dart';

Future<bool> isFirstLaunch() async {
  bool isFirstLaunch =
      await CacheHelper.getDataFromCache(key: Constants.kOnBoarding) ?? true;

  if (isFirstLaunch) {
    await CacheHelper.saveDataToCache(key: Constants.kOnBoarding, value: false);
  }
  debugMessage(isFirstLaunch.toString(), name: 'isFirstLaunch');

  return isFirstLaunch;
}
