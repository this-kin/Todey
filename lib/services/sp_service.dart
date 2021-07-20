import 'package:shared_preferences/shared_preferences.dart';

class SP {
  Future saveLoginSatate(String user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', user);
  }

  Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('user');
  }
}
