import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helper {
  static nextScreen(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  static replaceScreen(context, Widget page) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  static popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
