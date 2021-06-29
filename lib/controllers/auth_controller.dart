import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todey/ui/home_page.dart';
import 'package:todey/utils/helper.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var isSignedIn = false.obs;
  var userName = "".obs;
  var userImageUrl = "".obs;

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
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      Helper.replaceScreen(context, Main());

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      // print('signInWithGoogle succeeded: $user');
      // print(userName.value);

      return '$user';
    } else {
      return null;
    }
  }

  signOut() async {
    await googleSignIn.signOut();
    print("user signedOut");
  }
}
