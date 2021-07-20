import 'package:flutter/material.dart';

Color kBlackColor = Color(0xff292E3C);
Color kTextColor = Colors.white;
Color kImportantColor = Color(0xff2765FA);
Color kPlanedColor = Colors.amber;
Color kSettingColor = Color(0xff888A9B);
Color kBackgroundColor = Color(0xff2F2C53);
Color kPrimaryColor = Color(0xff5665FB);
Color kAccentColor = Color(0xffFD6F25);
Color kIconColor = Colors.white;
Color kDeletedColor = Colors.red;
Color kBackGroundColor2 = Color(0xff3E3B64);

Duration kDuration = Duration(milliseconds: 300);

//
TextStyle kAppBarTitleStyle =
    TextStyle(color: kTextColor, fontFamily: "Raleway", fontSize: 25);
//
TextStyle kListTileStyle = TextStyle(color: kTextColor, fontFamily: "MADType");
//
TextStyle kItemWidgetStyle = TextStyle(
    color: kTextColor, fontFamily: "Raleway", fontWeight: FontWeight.w400);

//
TextStyle kSwitchStyle =
    TextStyle(color: kTextColor, fontFamily: "MADType", fontSize: 18);

//
TextStyle kPrimaryStyle =
    TextStyle(color: kSettingColor, fontFamily: "MADType", fontSize: 18);

//
TextStyle kAccentStyle =
    TextStyle(color: kSettingColor, fontFamily: "MADType", fontSize: 18);

//app only uses one theme
ThemeData themeData = ThemeData(
    backgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    //canvasColor: Colors.transparent.withOpacity(1.0),
    accentColor: kAccentColor,
    iconTheme: IconThemeData(color: kIconColor));
