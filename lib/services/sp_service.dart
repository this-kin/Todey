import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todey/controllers/settings_controller.dart';

class SP {
  static String userKey = "USERKEY";
  static String languageKey = "LANGUAGEKEY";
  static String loggedKey = "ISLOGGED";

  // AuthService authController = Get.put(AuthService());
  SettingController settingController = Get.put(SettingController());

///////////CREATE
  static setUserImage(String user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userKey, user);
  }

  static setLanguage(String param1, String param2) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(languageKey, '$param1,$param2');
    print(param1);
  }

  static setLogged(bool isLogged) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedKey, isLogged);
  }

/////////////READ

  static Future<String> userImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     var imageUrl = preferences.getString(userKey);
    return imageUrl;
  }

 static Future<String> getLanguage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var lang = preferences.getString(languageKey);
    return lang;
  }

 static Future<bool> getLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedKey);
  }

//////////DELETE
  static clearAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
