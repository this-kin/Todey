import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/ui/settings/components/dialog.dart';
import 'package:todey/ui/settings/components/setting_title.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/widgets/kswitch.dart';

class Settings extends StatelessWidget {
  //build widget
  Padding buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "MADType",
          fontSize: 14.sp,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    //date time button will be from the boat ui

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        title: Text("Setttings", style: kAppBarTitleStyle),
      ),
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("General"),
            SettingTile(
              icon: MaterialCommunityIcons.chart_arc,
              btnText: "Stats",
              trailing: Text(""),
            ),
            SettingTile(
              icon: Entypo.language,
              btnText: "Language",
              trailing: Text("English"),
              onPressed: () {
                showModalBottomSheet(
                    builder: (BuildContext context) {
                      return KBottom();
                    },
                    context: context);
              },
            ),
            buildTitle("Notification"),
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
            buildTitle("Help & Feedback"),
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
