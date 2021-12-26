import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:todey/controllers/settings_controller.dart';
import 'package:todey/modules/setting/widget/setting_title.dart';
import 'package:todey/utils/constant.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  //

  final SettingController _con = Get.put(SettingController());

  var _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings".tr,
          style: theme.textTheme.headline2,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: theme.backgroundColor,
      ),
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child:
              // Obx(
              //   () =>
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('General'.tr),
              SettingTile(
                icon: _isDarkMode
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded,
                btnText: "Theme".tr,
                trailing: CupertinoSwitch(
                  value: _isDarkMode,
                  onChanged: (val) {
                    setState(() {
                      _isDarkMode = !_isDarkMode;
                      _con.changeTheme(val);
                    });
                  },
                ),
              ),
              SettingTile(
                icon: Entypo.language,
                btnText: "language".tr,
                trailing: Text("English"),
                onPressed: () {
                  //
                },
              ),
              buildTitle("Notification".tr),
              SettingTile(
                icon: CupertinoIcons.bell,
                btnText: "Nofitcation".tr,
                //   trailing: KSwitch(),
              ),
              SettingTile(
                icon: CupertinoIcons.bell_slash_fill,
                btnText: "daily_reminder".tr,
                //   trailing: KSwitch(),
              ),
              buildTitle("help_feed".tr),
              SettingTile(
                icon: Entypo.search,
                btnText: "suggest".tr,
                trailing: Text(""),
                onPressed: () {
                  _con.launchGmail();
                },
              ),
              SettingTile(
                icon: Icons.report_problem_outlined,
                btnText: "report".tr,
                trailing: Text(""),
                onPressed: () {
                  _con.showFeedback(context);
                },
              ),
              //
              SettingTile(
                icon: Entypo.twitter,
                btnText: "follow twitt".tr,
                trailing: Text(""),
                onPressed: () {
                  _con.launchTwitter();
                },
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ),
      ),
      // ),
    );
  }

  Padding buildTitle(String text) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: ConstanceData.abelFont,
          fontSize: 16.sp,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
