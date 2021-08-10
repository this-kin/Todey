import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static nextScreen(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
 }

  static replaceScreen(Widget page) {
    Get.off(page);
  }

  static popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
