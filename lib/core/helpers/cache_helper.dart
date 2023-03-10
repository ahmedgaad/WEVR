import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPref;
  static cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  // set - get - delete - clear of all data ---> (key , value)
  static Future<bool> saveDataToCache({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPref.setString(key, value);
    }
    if (value is int) {
      return await sharedPref.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPref.setBool(key, value);
    }

    return await sharedPref.setDouble(key, value);
  }

  static dynamic getDataFromCache({
    required String key,
  }) {
    return sharedPref.get(key);
  }

  static Future<bool> removeDataFromCache({
    required String key,
  }) async {
    return await sharedPref.remove(key);
  }
}
