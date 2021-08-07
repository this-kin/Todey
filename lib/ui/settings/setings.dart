import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/controllers/settings_controller.dart';
import 'package:todey/ui/settings/components/chart/chart.dart';
import 'package:todey/ui/settings/components/dialog.dart';
import 'package:todey/ui/settings/components/setting_title.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/helper.dart';
import 'package:todey/widgets/kswitch.dart';
import 'package:get/get.dart';

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

  SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    //date time button will be from the boat ui

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        title: Text('settings'.tr, style: kAppBarTitleStyle),
      ),
      backgroundColor: theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle('General'.tr),
            SettingTile(
              icon: MaterialCommunityIcons.chart_arc,
              btnText: "stats".tr,
              trailing: Text(""),
              onPressed: () {
                Helper.nextScreen(context, Chart());
              },
            ),
            SettingTile(
              icon: Entypo.language,
              btnText: "language".tr,
              trailing: Text("English"),
              onPressed: () {
                showModalBottomSheet(
                    builder: (BuildContext context) {
                      return KBottom();
                    },
                    context: context);
              },
            ),
            buildTitle("Notification".tr),
            SettingTile(
              icon: Entypo.notification,
              btnText: "Nofitcation".tr,
              trailing: KSwitch(),
            ),
            SettingTile(
              icon: Entypo.notifications_off,
              btnText: "daily_reminder".tr,
              trailing: KSwitch(),
            ),
            buildTitle("help_feed".tr),
            SettingTile(
              icon: AntDesign.search1,
              btnText: "suggest".tr,
              trailing: Text(""),
              onPressed: () {
                //
                settingController.launchGmail();
              },
            ),
            SettingTile(
              icon: MaterialCommunityIcons.hazard_lights,
              btnText: "report".tr,
              trailing: Text(""),
              onPressed: () {
                //
                settingController.reportProblem();
              },
            ),
            //
            SettingTile(
              icon: Entypo.twitter,
              btnText: "follow twitt".tr,
              trailing: Text(""),
              onPressed: () {
                settingController.launchTwitter();
              },
            ),
            //
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
