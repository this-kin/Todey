import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todey/services/sp_service.dart';
import 'package:todey/ui/home/home_page.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/helper.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var isSignedIn = false.obs;
  var userImageUrl = "".obs;

  SP spService = SP();

  @override
  void onReady() {
    super.onReady();
    spService.getLoginState(userImageUrl.value);
  }

  signInWithGooogle(BuildContext context) async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      final User user = authResult.user;
      if (user != null) {
        isSignedIn.value = false;
        userImageUrl.value = user.photoURL;
        spService.setLoginSatate(user.photoURL);
        Helper.replaceScreen(HomePage());

        final User currentUser = _auth.currentUser;
        assert(user.uid == currentUser.uid);
        return '$user';
      }
    } catch (e) {
      print(e);
    }
  }

  signOut(BuildContext context) async {
    try {
      await googleSignIn.signOut().then((val) {
        spService.clearAll();
        Helper.replaceScreen(Onboarding());
      });
    } catch (e) {
      print(e);
    }
  }
}
