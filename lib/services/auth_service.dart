import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxController {
  var _googleSigin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount>(null);

  Future login() async {
    try {
      googleAccount.value = await _googleSigin.signIn();
      return googleAccount.value;
    } catch (e) {}
  }

  void logout() async {
    try {} catch (e) {}
  }
}
