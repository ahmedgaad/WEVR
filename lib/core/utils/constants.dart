class Constants {
  static const String imagePath = "assets/images";
  static const int splashDelay = 3;
  static const int nextPageTime = 2;
  static const int previousPageTime = 2;
  static String? userToken;
  static bool? opendBefore;
  static bool? isGuest;
  static const String baseURL = "https://wevr.tech/api";
  static const String suggestionsBaseURL =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static const String googleAPIKey = "AIzaSyCMkk_sxmZiswgK9u3-BvcKoRHXzRnWEk8";
  static const String registerEP = "/register";
  static const String loginEP = "/login";
  static const String logoutEP = "/logout";
  static const String resetViaEmailEP = "/resetViaEmail";
  static const String newPasswordEP = "/newPassword";
  static const String checkOTPEP = "/checkOTP";
  static const String apartment = "/apartment";
  static const String saveApartment = "/save/apartment/";
  static const String savedApartment = "/saved/apartment";
  static const String search = "/search";
  static String kToken = "token";
  static String kOnBoarding = "onboarding";
}
