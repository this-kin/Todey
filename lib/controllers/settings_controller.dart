import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  //
  var isNotification = false.obs;
  var isDailyReminder = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  // change language
  void changeLanguage(param1, param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
  // switch flip

  flipSwitch(value) {
    value = !value;
    print(value);
  }

  // launch url
  launchGmail() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'flutterboyfriend200@gmail.com',
        query: 'subject=Suggest A Feature Todey&body= ');
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch gmail');
    }
  }

  //Report a problem
  reportProblem() async {
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

  launchTwitter() async {
    final String url = 'https://www.twitter.com/@flutterboy1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch twitter');
    }
  }
}
