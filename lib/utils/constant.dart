import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color kBlackColor = Color(0xff292E3C);
Color kTextColor = Colors.white;
Color kImportantColor = Color(0xff2765FA);
Color kPlanedColor = Colors.amber;
Color kSettingColor = Color(0xff888A9B);
Color kBackgroundColor = Color(0xff2F2C53);
//Color(0xff262545);
Color kPrimaryColor = Color(0xff5665FB);
Color kAccentColor = Color(0xffFD6F25);
Color kIconColor = Colors.white;

Color kDeletedColor = Colors.red;

/////////////////
Color kFunColor = Color(0xff1FBFFD);
Color kFamilyColor = Colors.redAccent;
Color kWorkColor = Color(0xff020F2F);
Color kPersonalColor = Colors.white;
Color kDefaultColor = Colors.transparent;
Color kHomeColor = Colors.green;

//////////
Color kBackGroundColor2 = Color(0xff3E3B64);

Duration kDuration = Duration(milliseconds: 300);

//
TextStyle kAppBarTitleStyle =
    TextStyle(color: kTextColor, fontFamily: "Raleway", fontSize: 24.sp);
//
TextStyle kListTileStyle =
    TextStyle(color: kTextColor, fontFamily: "MADType", fontSize: 16.sp);
//
TextStyle kItemWidgetStyle = TextStyle(
    color: kTextColor, fontFamily: "Raleway", fontWeight: FontWeight.w400);

//
TextStyle kSwitchStyle =
    TextStyle(color: kTextColor, fontFamily: "MADType", fontSize: 18.sp);

//
TextStyle kPrimaryStyle =
    TextStyle(color: kSettingColor, fontFamily: "MADType", fontSize: 18.sp);

//
TextStyle kAccentStyle =
    TextStyle(color: kSettingColor, fontFamily: "MADType", fontSize: 18.sp);

//app only uses one theme
ThemeData themeData = ThemeData(
    backgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    //canvasColor: Colors.transparent.withOpacity(1.0),
    accentColor: kAccentColor,
    iconTheme: IconThemeData(color: kIconColor));
