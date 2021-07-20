import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formattedDate() {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE  d ");
  String formatted = formatter.format(now);

  return formatted;
}

String formattedTime({TimeOfDay time, context}) {
  var now = time;
  var formatter = now.format(context);
  return formatter;
}
