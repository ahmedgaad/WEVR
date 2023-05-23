import '../helpers/cache_helper.dart';
import '../utils/constants.dart';

bool isAuthorized() {
  String? token = CacheHelper.getDataFromCache(key: Constants.kToken);
  if (token == null) {
    return false;
  }
  return true;
}
