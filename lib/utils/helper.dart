import 'package:intl/intl.dart';
import 'package:todey/constants/color_constants.dart';
import 'package:todey/utils/exports.dart';

//DateTime Now formatter
String formattedNow() {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE  d ");
  String formatted = formatter.format(now);

  return formatted;
}

getAvatar(String eventType) {
  switch (eventType) {
    case "Fun":
      return ConstanceData.gameIcon;
      break;
    case "Academic":
      return ConstanceData.studyingIcon;
      break;
    case "Personal":
      return ConstanceData.userIcon;
      break;
    case "Family":
      return ConstanceData.familyIcon;
      break;
    case "Work":
      return ConstanceData.suitcaseIcon;
      break;
    default:
  }
}

Color avatarColor(String title) {
  switch (title) {
    case "Fun":
      return funColor;
      break;
    case "Family":
      return familyColor;
      break;
    case "Personal":
      return personalColor;
      break;
    case "Work":
      return workColor;
      break;
    case "Academic":
      return defaultColor;
      break;
    default:
      return defaultColor;
      break;
  }
}

Color getColor(String eventType) {
  switch (eventType) {
    case "Important":
      return kImportantColor;
      break;
    case "Planned":
      return kPlanedColor;
      break;
    default:
      return defaultColor;
      break;
  }
}
