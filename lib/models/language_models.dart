import 'package:get/get.dart';
import 'package:todey/controllers/settings_controller.dart';

SettingController controller = Get.put(SettingController());

class Language {
  final String title;
  final String param1;
  final String param2;

  Language({this.title, this.param1, this.param2});
}

Language english = Language(
  title: "English",
  param1: "en",
  param2: "US",
);
Language portugese = Language(
  title: "Portugese",
  param1: "pt",
  param2: "ANG",
);
Language french = Language(
  title: "French",
  param1: "fr",
  param2: "FR",
);

List<Language> allLang = [english, portugese, french];
