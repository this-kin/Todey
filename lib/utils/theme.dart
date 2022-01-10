import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class CustomTheme {
//
  static const Color _primaryColor1 = Color(0xff1C68F0);
  static const Color _primaryColor2 = Color(0xff2281F5);

  static const Color _deleteColor = Color(0xffE34946);
  static const Color _updateColor = Color(0xffED9B1E);
  

  static ColorScheme _lightColorScheme = ColorScheme.light(
    primary: _primaryColor1,
    secondary: _primaryColor2,
    brightness: Brightness.light,
  );
  static ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: _primaryColor1,
    secondary: _primaryColor2,
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
      primaryColor: _primaryColor2,
      buttonColor: _primaryColor2,
      accentColor: Colors.grey,
      // colorScheme: _lightColorScheme,
      scaffoldBackgroundColor: const Color(0xff2F2C53),
      backgroundColor: const Color(0xff2F2C53),
      errorColor: _deleteColor,
      platform: TargetPlatform.iOS,
      cursorColor: _primaryColor2,
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
        dialHandColor: _primaryColor2,
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
      primaryColor: _primaryColor2,
      buttonColor: _primaryColor2,
      splashColor: Colors.white38,
      splashFactory: InkRipple.splashFactory,
      accentColor: Colors.grey,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      errorColor: _deleteColor,
      cursorColor: _primaryColor2,
      typography: Typography(),
      platform: TargetPlatform.iOS,
      brightness: Brightness.dark,
      textTheme: _lightTextTheme,
      iconTheme: IconThemeData(color: Colors.grey),
      primaryIconTheme: IconThemeData(color: Colors.grey),
      accentIconTheme: IconThemeData(color: Colors.grey),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: const Color(0xFFFFFFFF),
        dialHandColor: _primaryColor2,
        dialTextColor: Colors.black,
        // entryModeIconColor: Colors.grey,
        dialBackgroundColor: Colors.grey.withOpacity(0.2),
        hourMinuteTextColor: _primaryColor1,
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
