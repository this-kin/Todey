import 'package:intl/intl.dart';

//DateTime Now formatter
String formattedNow() {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE  d ");
  String formatted = formatter.format(now);

  return formatted;
}
