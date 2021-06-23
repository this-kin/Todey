import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/utils/theme.dart';
import 'package:todey/widgets/setting_tile.dart';
import 'package:todey/widgets/sized_box.dart';

class SetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General",
              style: styleText(),
            ),
            SettingTile(
              btnText: "Stats",
              onPressed: () {},
              icon: FlutterIcons.chart_arc_mco,
            ),
            SettingTile(
                btnText: "Add new events on top",
                onPressed: () {},
                icon: Entypo.list),
            SettingTile(
              btnText: "Confirm before deleting",
              onPressed: () {},
              icon: FontAwesome.remove,
            ),
            SettingTile(
                btnText: "Language",
                onPressed: () {},
                icon: MaterialIcons.language),
            Sizer(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Notification",
              style: styleText(),
            ),
            SettingTile(
                btnText: "Notification priority",
                onPressed: () {},
                icon: Entypo.notification),
            SettingTile(
                btnText: "Notification timer",
                onPressed: () {},
                icon: Entypo.time_slot),
            SettingTile(
                btnText: "Plan your day reminder",
                onPressed: () {},
                icon: FlutterIcons.reminder_mco),
            Sizer(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Help & Feedback",
              style: styleText(),
            ),
            SettingTile(
                btnText: "Suggest a feature",
                onPressed: () {},
                icon: FlutterIcons.feature_search_mco),
            SettingTile(
                btnText: "Rate Us",
                onPressed: () {},
                icon: MaterialIcons.rate_review),
            Sizer(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "About",
              style: styleText(),
            ),
            SettingTile(
                btnText: "Follow us on twitter",
                onPressed: () {},
                icon: AntDesign.twitter),
            SettingTile(
                btnText: "Report a problem",
                onPressed: () {},
                icon: MaterialIcons.report_problem),
            SettingTile(
                btnText: "Version 2.1.0",
                onPressed: () {},
                icon: FlutterIcons.versions_oct),
          ],
        ),
      ),
    );
  }

  TextStyle styleText() {
    return TextStyle(
        color: themeData.accentColor, fontFamily: "MADType", fontSize: 15);
  }
}
