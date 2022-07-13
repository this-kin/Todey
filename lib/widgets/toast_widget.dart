import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todey/constants/color_constants.dart';
import 'package:todey/core/exports.dart';

dynamic successToast(String message, context) {
  return Fluttertoast.showToast(
    msg: message,
    backgroundColor: kPrimaryColor,
    textColor: whiteColor,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}

dynamic failureToast(String message, context) {
  return Fluttertoast.showToast(
    msg: message,
    backgroundColor: deleteColor,
    textColor: whiteColor,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}
