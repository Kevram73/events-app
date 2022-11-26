import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._ctor();
  factory Preferences() {
    return _instance;
  }

  Preferences._ctor();

  late SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString("token") ?? "";
  }

  set token(String value) {
    _prefs.setString("token", value);
  }
}
