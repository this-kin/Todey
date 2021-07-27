import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todey/services/sp_service.dart';
import 'package:todey/ui/home/home_page.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/helper.dart';

///////to be re-written
class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var isSignedIn = false.obs;
  var userName = "".obs;
  var userImageUrl = "".obs;

  var sp = SP();

  @override
  void onReady() {
    getLoginState();
    super.onReady();
  }

  signInWithGooogle(BuildContext context) async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);

    final User user = authResult.user;
    if (user != null) {
      assert(user.displayName != null);
      assert(user.photoURL != null);
      isSignedIn.value = false;
      userName.value = user.displayName;
      userImageUrl.value = user.photoURL;
      sp.saveLoginSatate(user.photoURL);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      Helper.replaceScreen(context, HomePage());

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      return '$user';
    } else {
      return null;
    }
  }

  Future<String> getLoginState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userImageUrl.value = preferences.getString('user');
    return userImageUrl.value;
  }

  signOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await googleSignIn.signOut().then((value) {
      if (value == null) {
        sp.removeUser();
        Helper.replaceScreen(context, Onboarding());
      }
    });
  }

  // Future<String> removeUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   userImageUrl.value = preferences.getString('user');
  //   return userImageUrl.value;
  // }
}
