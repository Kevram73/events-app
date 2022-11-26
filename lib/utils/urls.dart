class Urls {
  // URL de base de l'application
  static const String baseUrl = "https://app.evant.com/";

  // API
  static const String apiUrl = "${baseUrl}api/";

  // Auth urls
  static const String login = "${apiUrl}login/";
  static const String register = "${apiUrl}register/";
  static const String forgotP = "${apiUrl}forgot-password/";
  static const String resetP = "${apiUrl}reset-password/";
  static const String userInfo = "${apiUrl}user/";

  // Announces urls
  static const String announces = "${apiUrl}announces/";
  static const String createAnnounce = "${apiUrl}announce/create/";
  static const String editAnnounce = "${apiUrl}announce/edit/";
  static const String deleteAnnounce = "${apiUrl}announce/delete/";
}
