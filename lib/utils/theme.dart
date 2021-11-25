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
  );

  static TextTheme _lightTextTheme = TextTheme(
    overline: TextStyle(
      fontFamily: ConstanceData.abelFont,
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
  );

  static TextTheme _darkTextTheme = TextTheme(
    overline: TextStyle(
      fontFamily: ConstanceData.abelFont,
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
    );
  }

  static ThemeData buildLightTheme() {
    return ThemeData(
      //  colorScheme: _lightColorScheme,
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
