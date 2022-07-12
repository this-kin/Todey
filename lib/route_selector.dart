import 'package:hive_flutter/hive_flutter.dart';
import 'package:todey/constants/string_constant.dart';
import 'package:todey/core/exports.dart';
import 'package:todey/data/models/user_data.dart';
import 'package:todey/modules/home/home.dart';

class RouteSelector extends StatelessWidget {
  const RouteSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<UserData>(userDataString).listenable(),
        builder: (_, Box<UserData> box, value) {
          final UserData userData = box.get(userDataKey);
          if (userData == null) {
            return Onboard();
          } else {
            return Home();
          }
        });
  }
}
