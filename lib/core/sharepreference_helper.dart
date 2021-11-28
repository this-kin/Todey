import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  ///
  static String usernameKey = "USERNAMEKEY";
  static String userimageKey = "USERIMAGEKEY";
  static String useremailKey = "USEREMAILKEY";

  //
  static Future saveUsername({username}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(usernameKey, username.toString());
  }

  static Future saveUserimage({imageurl}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(userimageKey, imageurl.toString());
  }

  static Future saveUserEmail({email}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString(useremailKey, email.toString());
  }

  static Future<bool> clearUser() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.clear();
  }

  ////

  static Future<String> getUsername() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(usernameKey);
  }

  static Future<String> getUserimage() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(userimageKey);
  }

  static Future<String> getUseremail() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString(useremailKey);
  }
}
