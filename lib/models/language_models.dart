import 'package:flutter/cupertino.dart';

class Language {
  final String title;
  final Function onPressed;

  Language({this.title, this.onPressed});
}

Language english = Language(
  title: "English",
  onPressed: () {
    //select english
  },
);
Language portugese = Language(
  title: "Portugese",
  onPressed: () {
    //select portugese
  },
);
Language french = Language(
  title: "French",
  onPressed: () {
    //select french
  },
);

List<Language> allLang = [english, portugese, french];
