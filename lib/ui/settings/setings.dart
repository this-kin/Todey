import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/ui/settings/components/kappbar.dart';
import 'package:todey/ui/settings/components/kswitch.dart';
import 'package:todey/ui/settings/components/setting_title.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    //date time button will be from the boat ui

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: KAppbar(),
      ),
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingTile(
              icon: MaterialCommunityIcons.chart_arc,
              btnText: "Stats",
              trailing: Text(""),
            ),
            SettingTile(
              icon: Entypo.language,
              btnText: "Language",
              trailing: Text("English"),
            ),
            SettingTile(
              icon: Entypo.notification,
              btnText: "Nofitcation",
              trailing: KSwitch(),
            ),
            SettingTile(
              icon: Entypo.notifications_off,
              btnText: "Daily Reminder",
              trailing: KSwitch(),
            ),
            SettingTile(
              icon: AntDesign.search1,
              btnText: "Suggest a feature",
              trailing: Text(""),
            ),
            SettingTile(
              icon: MaterialCommunityIcons.hazard_lights,
              btnText: "Report a problem",
              trailing: Text(""),
            ),
            SettingTile(
              icon: Entypo.twitter,
              btnText: "Follow us on Twitter",
              trailing: Text(""),
            ),
            SettingTile(
              icon: Icons.phone_android,
              btnText: "Version 2.1.0",
              trailing: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
