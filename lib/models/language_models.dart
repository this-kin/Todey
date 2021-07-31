import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/settings_controller.dart';

SettingController controller = Get.put(SettingController());

class Language {
  final String title;
  final String param1;
  final String param2;
  final int value;

  Language({this.title, this.param1, this.param2, @required this.value});
}

Language english = Language(
  title: "English",
  param1: "en",
  param2: "US",
  value: 0,
);
Language portugese = Language(
  title: "Portugese",
  param1: "pt",
  param2: "ANG",
  value: 1,
);
Language french = Language(
  title: "French",
  param1: "fr",
  param2: "FR",
  value: 2,
);

List<Language> allLang = [english, portugese, french];
