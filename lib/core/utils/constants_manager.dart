class ConstantsManager {
  static const String imagePath = "assets/images";
  static const int splashDelay = 3;
  static const int nextPageTime = 2;
  static const int previousPageTime = 2;
  static String? userToken;
  static bool isGuest = false;
  static const String baseURL = "https://wevr.tech/api";
  static const String registerEP = "/register";
  static const String loginEP = "/login";
  static const String logoutEP = "/logout";
  static const String resetViaEmailEP = "/resetViaEmail";
  static const String newPasswordEP = "/newPassword";
  static const String checkOTPEP = "/checkOTP";
}
