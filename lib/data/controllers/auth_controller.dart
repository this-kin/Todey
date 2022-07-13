import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todey/constants/constant.dart';
import 'package:todey/constants/string_constant.dart';
import 'package:todey/data/models/user_data.dart';
import 'package:todey/modules/home/home.dart';
import 'package:todey/modules/onboard/onboard.dart';
import 'package:todey/widgets/toast_widget.dart';

class AuthController extends GetxController {
  // instance
  static final AuthController instance = Get.put(AuthController());

  // firebase auth
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  // user
  Rx<User> user = Rx<User>(null);

  // on ready
  @override
  void onReady() {
    super.onReady();
    user.bindStream(_auth.userChanges());
    ever(user, checkUser);
    checkUser(user.value);
  }

  // check existing user
  void checkUser(User user) {
    if (user == null) {
      Get.offAll(Onboard());
    } else {
      Get.offAll(Home());
    }
  }

  // login with google
  void login(context) async {
    final GoogleSignInAccount _googleSignAccount = await _googleSignIn.signIn();
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
        user.value = _credential.user;

        final UserData userData = UserData(
          id: _credential.user.uid,
          username: _credential.user.displayName,
          email: _credential.user.email,
          imageUrl: _credential.user.photoURL,
        );
        setUserStateToHive(userData);
        successToast("Google Authentication Successful", context);
      } else {
        failureToast(ConstanceData.error, context);
      }
    } catch (e) {
      failureToast(e.toString(), context);
    }
  }

  // logout
  void logout(context) async {
    await _auth.signOut().then((value) async {
      final box = await Hive.openBox(userDataString);
      box.delete(userDataKey);
      successToast("User logged out", context);
    }, onError: (err) {
      failureToast(err.toString(), context);
    });
  }
}
