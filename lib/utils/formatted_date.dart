import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//DateTime Now formatter
String formattedNow() {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE  d ");
  String formatted = formatter.format(now);

  return formatted;
}
//Time Formatter

String formattedTime({TimeOfDay time, context}) {
  var now = time;
  var formatter = now.format(context);
  return formatter;
}

// Formatted date
String formattedDate(DateTime date) {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE  d ");
  String formatted = formatter.format(now);

  return formatted;
}
