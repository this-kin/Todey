import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import 'package:todey/utils/constant.dart';

class ShowToast {
  static unavailableFeature(BuildContext context) {
    Toast.show("Unavailable", context, backgroundColor: kImportantColor);
  }

  static loggedInSucess(BuildContext context) {
    Toast.show("Logged in Successfully", context,
        backgroundColor: kImportantColor);
  }

  static loggedOutSuccess(BuildContext context) {
    Toast.show("Logged out Successfully", context,
        backgroundColor: kImportantColor);
  }

  static deleteEvent(BuildContext context) {
    Toast.show("Event deleted", context, backgroundColor: kImportantColor);
  }

  static updateEvent(BuildContext context) {
    Toast.show("Event updated", context, backgroundColor: kImportantColor);
  }

  static checkEvent(BuildContext context) {
    Toast.show(
      "fields cannot be empty",
      context,
      backgroundColor: kImportantColor,
    );
  }
}
