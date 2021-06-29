import 'package:intl/intl.dart';

String formattedDate() {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE  d ");
  String formatted = formatter.format(now);

  return formatted;
}
