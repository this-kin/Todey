import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todey/utils/constant.dart';

class CustomTheme {
//
  static const Color _primaryColor1 = Color(0xff1C68F0);
  static const Color _primaryColor2 = Color(0xff2281F5);

  static const Color _deleteColor = Color(0xffE34946);
  static const Color _updateColor = Color(0xffED9B1E);

  static ThemeData getThemeData() {
    var theme = true;

    if (theme) {
      return _buildLightTheme();
    } else {
      return _buildDarkTheme();
    }
  }

  static const TextTheme _lightTextTheme = TextTheme();

  static const TextTheme _darkTextTheme = TextTheme();

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: _primaryColor1,
      secondary: _primaryColor2,
      brightness: Brightness.light,
    );
    return base.copyWith(
      primaryColor: _primaryColor1,
      buttonColor: _primaryColor1,
      indicatorColor: Colors.white,
      accentColor: Colors.grey,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF1D193D),
      backgroundColor: const Color(0xFF1D193D),
      errorColor: _deleteColor,
      platform: TargetPlatform.iOS,
      cursorColor: _primaryColor1,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      typography: Typography(),
      iconTheme: IconThemeData(color: Colors.white),
      primaryIconTheme: IconThemeData(color: Colors.white),
      accentIconTheme: IconThemeData(color: Colors.white),
      textTheme: _darkTextTheme,
    );
  }

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: _primaryColor1,
      secondary: _primaryColor2,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: _primaryColor1,
      buttonColor: _primaryColor1,
      splashColor: Colors.white38,
      splashFactory: InkRipple.splashFactory,
      accentColor: Colors.grey,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      errorColor: _deleteColor,
      cursorColor: _primaryColor1,
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
