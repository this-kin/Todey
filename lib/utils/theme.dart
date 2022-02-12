import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class CustomTheme {
//
  static const Color primaryColor1 = Color(0xff1C68F0);
  static const Color primaryColor2 = Color(0xff2281F5);

  static const Color deleteColor = Color(0xffE34946);
  static const Color updateColor = Color(0xffED9B1E);
  static const Color funColor = Color(0xff1FBFFD);
  static const Color familyColor = Colors.redAccent;
  static const Color workColor = Color(0xff020F2F);
  static const Color personalColor = Colors.white;
  static const Color defaultColor = Colors.transparent;
  static const Color homeColor = Colors.green;
  static const Color kImportantColor = Color(0xff2765FA);
  static const Color kPlanedColor = Colors.amber;
  static const Color kSettingColor = Color(0xff888A9B);
  static const Color kBackgroundColor = Color(0xff2F2C53);

  static ColorScheme _lightColorScheme = ColorScheme.light(
    primary: primaryColor1,
    secondary: primaryColor2,
    brightness: Brightness.light,
  );
  static ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: primaryColor1,
    secondary: primaryColor2,
    brightness: Brightness.dark,
  );

  static TextTheme _lightTextTheme = TextTheme(
    overline: TextStyle(
      fontFamily: ConstanceData.ralewayFont,
      fontSize: 17.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 15.sp,
      fontFamily: ConstanceData.ralewayFont,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontFamily: ConstanceData.ralewayFont,
      fontSize: 22.sp,
    ),
    headline3: TextStyle(
      color: Colors.grey,
      fontFamily: ConstanceData.ralewayFont,
      fontSize: 20.sp,
    ),
    headline4: TextStyle(
      color: Colors.grey,
      fontSize: 16.sp,
      // fontFamily: ConstanceData.abelFont,
    ),
    headline5: TextStyle(
      fontSize: 15.sp,
      fontFamily: ConstanceData.abelFont,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontSize: 11.sp,
      fontFamily: ConstanceData.abelFont,
    ),
  );

  static TextTheme _darkTextTheme = TextTheme(
    overline: TextStyle(
      fontFamily: ConstanceData.ralewayFont,
      fontSize: 17.sp,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 15.sp,
      fontFamily: ConstanceData.ralewayFont,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontFamily: ConstanceData.ralewayFont,
      fontSize: 24.sp,
    ),
    headline3: TextStyle(
      color: Colors.grey,
      fontFamily: ConstanceData.ralewayFont,
      fontSize: 20.sp,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      // fontFamily: ConstanceData.abelFont,
    ),
    headline5: TextStyle(
      fontSize: 15.sp,
      fontFamily: ConstanceData.abelFont,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 11.sp,
      fontFamily: ConstanceData.abelFont,
    ),
  );

  static ThemeData buildDarkTheme() {
    return ThemeData(
      indicatorColor: Colors.white,
      primaryColor: primaryColor2,
      buttonColor: primaryColor2,
      accentColor: Colors.grey,
      // colorScheme: _lightColorScheme,
      scaffoldBackgroundColor: const Color(0xff2F2C53),
      backgroundColor: const Color(0xff2F2C53),
      errorColor: deleteColor,
      platform: TargetPlatform.iOS,
      cursorColor: primaryColor2,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      typography: Typography(),
      iconTheme: IconThemeData(color: Colors.white),
      primaryIconTheme: IconThemeData(color: Colors.white),
      accentIconTheme: IconThemeData(color: Colors.white),
      textTheme: _darkTextTheme,
      // colorScheme: _darkColorScheme,
      timePickerTheme: TimePickerThemeData(
        backgroundColor: const Color(0xff2F2C53),
        dialHandColor: primaryColor2,
        dialTextColor: Colors.white,
        dialBackgroundColor: Colors.grey.withOpacity(0.2),
        hourMinuteTextColor: Colors.white,
        //  dayPeriodTextColor: Colors.white,
        dayPeriodColor: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  static ThemeData buildLightTheme() {
    return ThemeData(
      primaryColor: primaryColor2,
      buttonColor: primaryColor2,
      splashColor: Colors.white38,
      splashFactory: InkRipple.splashFactory,
      accentColor: Colors.grey,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      errorColor: deleteColor,
      cursorColor: primaryColor2,
      typography: Typography(),
      platform: TargetPlatform.iOS,
      brightness: Brightness.dark,
      textTheme: _lightTextTheme,
      iconTheme: IconThemeData(color: Colors.grey),
      primaryIconTheme: IconThemeData(color: Colors.grey),
      accentIconTheme: IconThemeData(color: Colors.grey),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: const Color(0xFFFFFFFF),
        dialHandColor: primaryColor2,
        dialTextColor: Colors.black,
        // entryModeIconColor: Colors.grey,
        dialBackgroundColor: Colors.grey.withOpacity(0.2),
        hourMinuteTextColor: primaryColor1,
        dayPeriodColor: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
