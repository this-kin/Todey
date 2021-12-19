import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';
import 'package:todey/helpers/sharepreference_helper.dart';
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

  //check if user is registered
  void checkUser(User user) {
    if (user == null) {
      Get.offAll(Onboard());
    } else {
      Get.offAll(Home());
    }
  }

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
        SharedPreferenceHelper.saveUserEmail(email: _user.value.email);
        SharedPreferenceHelper.saveUserimage(imageurl: _user.value.photoURL);
        SharedPreferenceHelper.saveUsername(username: _user.value.displayName);
        SharedPreferenceHelper.saveUserid(uuid: _user.value.uid.toString());
      } else {
        Toast.show(ConstanceData.error, context);
      }
    } catch (e) {
      Toast.show(e.toString(), context);
    }
  }

// logout / clear user
  void logout(context) async {
    await _auth.signOut().then((value) => SharedPreferenceHelper.clearUser(),
        onError: (err) {
      Toast.show(err.toString(), context);
    });
    // Toast.show(e.toString(), context);
  }
}
