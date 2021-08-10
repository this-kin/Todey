import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todey/controllers/settings_controller.dart';

class SP {
  static const String userKey = "USERKEY";
  static const String languageKey = "LANGUAGEKEY";

  // AuthService authController = Get.put(AuthService());
  SettingController settingController = Get.put(SettingController());

///////////CREATE
  Future setLoginSatate(String user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userKey, user);
  }

  Future setLanguage(String param1, String param2) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(languageKey, '$param1,$param2');
    print(param1);
  }

/////////////READ

  Future<String> getLoginState(String imageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    imageUrl = preferences.getString(userKey);
    return imageUrl;
  }

  Future<String> getLanguage(String langCode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    langCode = preferences.getString(languageKey);
    return langCode;
  }

//////////DELETE
  Future clearAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
