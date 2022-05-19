import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todey/constants/string_constant.dart';
import 'package:todey/data/models/user_data.dart';
import 'package:todey/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:todey/modules/onboard/onboard.dart';
import 'package:todey/utils/constant.dart';

class AuthService extends GetxController {
  User get user => _user.value;

  Rx<User> _user = Rx<User>(null);

  FirebaseAuth _auth = FirebaseAuth.instance;
  //
  void onReady() {
    super.onReady();
    _user = Rx<User>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, checkUser);
    checkUser(_user.value);
  }

  // check if user is registered
  void checkUser(User user) {
    if (user == null) {
      Get.offAll(Onboard());
    } else {
      Get.offAll(Home());
    }
  }

  static final AuthService instance = Get.put(AuthService());

  // google signing
  void login(context) async {
    final GoogleSignIn _googleSign = GoogleSignIn();

    final GoogleSignInAccount _googleSignAccount = await _googleSign.signIn();

    final GoogleSignInAuthentication _googleAuth =
        await _googleSignAccount.authentication;

    final GoogleAuthCredential _authCredential = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );

    try {
      UserCredential _credential =
          await _auth.signInWithCredential(_authCredential);
      if (_credential.user != null) {
        _user.value = _credential.user;
        final UserData userData = UserData(
          id: _credential.user.uid,
          username: _credential.user.displayName,
          email: _credential.user.email,
          imageUrl: _credential.user.photoURL,
        );
        setUserStateToHive(userData);
      } else {
        Fluttertoast.showToast(
            msg: ConstanceData.error, backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(), backgroundColor: Colors.redAccent);
    }
  }

// logout / clear user
  void logout(context) async {
    await _auth.signOut().then((value) async {
      final box = await Hive.openBox(userDataString);
      box.delete(userDataKey);
    }, onError: (err) {
      Fluttertoast.showToast(
          msg: err.toString(), backgroundColor: Colors.redAccent);
    });
  }
}
