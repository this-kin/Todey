import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class AuthService extends GetxController {
//google signing

  void googleSigning() async {
    try {
      debugPrint("Sign in With Google");
    } catch (e) {}
  }

  void logout() async {
    try {} catch (e) {}
  }
}
