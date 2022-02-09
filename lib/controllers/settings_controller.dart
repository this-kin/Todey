import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/services/sharepreference_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  var theme = true.obs;
  var notification = true.obs;
  var reminder = true.obs;

  var defaultLanguage = 'en, US'.obs;

  @override
  void onReady() {
    super.onReady();
    getSharedPref();
  }

  void getSharedPref() async {
    theme.value = await SharedPreferenceHelper().getTheme();
    print(theme);
  }

  // change language
  changeLanguage(param1, param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
    //save state of current language
    // spService.setLanguage(param1, param2);
    print('$param1, $param2');
    update();
  }

  // switch flip

  flipSwitch(value) {
    value = !value;
    print(value);
  }

  // launch url
  void launchGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'flutterboyfriend200@gmail.com',
      query: 'subject= Suggest A Feature Todey&body = ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  //Report a problem
  void reportProblem() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'flutterboyfriend200@gmail.com',
        query: 'subject=Report A Problem Todey&body= ');
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  void launchTwitter() async {
    final String url = 'https://www.twitter.com/@ichie200';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch twitter');
    }
  }

  Future<void> changeTheme(bool value) async {
    if (value) {
      theme.value = true;
      Get.changeThemeMode(ThemeMode.dark);
      update();
      await SharedPreferenceHelper().saveTheme(isLight: value);
    } else {
      theme.value = false;
      Get.changeThemeMode(ThemeMode.light);
      await SharedPreferenceHelper().saveTheme(isLight: value);
      update();
    }
  }

  void showFeedback(context) {
    BetterFeedback.of(context).show((UserFeedback feedback) {
      print(feedback.text);
    });
  }
}
