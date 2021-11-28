import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:todey/core/sharepreference_helper.dart';
import 'package:todey/modules/home/home.dart';

class AuthService extends GetxController {
  var _googleSigin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount>(null);

  void login(context) async {
    try {
      googleAccount.value = await _googleSigin.signIn();
      if (googleAccount.value != null) {
        SharedPreferenceHelper.saveUserimage(
            imageurl: googleAccount.value.photoUrl);
        SharedPreferenceHelper.saveUsername(
            username: googleAccount.value.displayName);
        SharedPreferenceHelper.saveUserEmail(email: googleAccount.value.email)
            .then((value) => Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => Home()), (route) => false));
        // print(
        //     "=============> username is  ${googleAccount.value.displayName} ================>");
      } else {}
    } catch (e) {
      Toast.show(e.toString(), context);
    }
  }

  void logout(context) async {
    try {
      googleAccount.value = await _googleSigin.signOut();
      if (googleAccount.value == null) {
        SharedPreferenceHelper.clearUser();
      }
    } catch (e) {
      Toast.show(e.toString(), context);
    }
  }
}
