import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  ///
  String _usernameKey = "USERNAMEKEY";
  static const String _userimageKey = "USERIMAGEKEY";
  static const String _useremailKey = "USEREMAILKEY";
  static const String _useridKey = "USERIDKEY";
  static const _themeKey = "THEMEKEY";

  //
  Future<bool> saveUsername({username}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(_usernameKey, username.toString());
  }

  Future<bool> saveUserimage({imageurl}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(_userimageKey, imageurl.toString());
  }

  Future<bool> saveUserEmail({email}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(_useremailKey, email.toString());
  }

  Future<bool> saveUserid({uuid}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(_useridKey, uuid);
  }

  Future<bool> saveTheme({bool isLight}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(_themeKey, isLight);
  }

  ////

  Future<String> getUsername() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(_usernameKey);
  }

  Future<String> getUserimage() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(_userimageKey);
  }

  Future<String> getUseremail() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(_useremailKey);
  }

  Future<bool> getTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(_themeKey);
  }

  //
  Future<bool> clearUser() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.clear();
  }
}
