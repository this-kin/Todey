import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  ///
  static String _usernameKey = "USERNAMEKEY";
  static String _userimageKey = "USERIMAGEKEY";
  static String _useremailKey = "USEREMAILKEY";
  static String _useridKey = "USERIDKEY";
  static const _themeKey = "THEMEKEY";

  //
  static Future<bool> saveUsername({username}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(_usernameKey, username.toString());
  }

  static Future<bool> saveUserimage({imageurl}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(_userimageKey, imageurl.toString());
  }

  static Future<bool> saveUserEmail({email}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(_useremailKey, email.toString());
  }

  static Future<bool> saveUserid({uuid}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(_useridKey, uuid);
  }

  static Future<bool> saveTheme({bool isLight}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(_themeKey, isLight);
  }

  ////

  static Future<String> getUsername() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(_usernameKey);
  }

  static Future<String> getUserimage() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(_userimageKey);
  }

  static Future<String> getUseremail() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(_useremailKey);
  }

  static Future<bool> getTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(_themeKey);
  }

  ///
  static Future<bool> clearUser() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.clear();
  }
}
