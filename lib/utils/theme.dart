import 'package:flutter/material.dart';
import 'package:todey/utils/global.dart' as global;

class CustomTheme {
  static ThemeData getThemeData() {
    if (global.isLight) {
      return _buildLightTheme();
    } else {
      return _buildDarkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith();
  }

  static ThemeData _buildDarkTheme() {
    Color primaryColor = HexColor(global.primaryDarkColorString);
    final ThemeData base = ThemeData.dark();
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    return base.copyWith(
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      accentColor: primaryColor,
      // canvasColor: const Color(0xFF202124),
      scaffoldBackgroundColor: const Color(0xFF212121),
      // backgroundColor: const Color(0xFF202124),
      errorColor: const Color(0xFFB00020),
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  static ThemeData _buildLightTheme() {
    Color primaryColor = HexColor(global.primaryLightColorString);

    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      // cupertinoOverrideTheme: _buildCupertinoTheme(base.cupertinoOverrideTheme),
      colorScheme: colorScheme,
      primaryColor: Colors.deepPurpleAccent,
      buttonColor: primaryColor,
      // indicatorColor: Colors.white,
      splashColor: Colors.white38,
      splashFactory: InkRipple.splashFactory,
      accentColor: primaryColor,
      // canvasColor: Colors.white,
      // scaffoldBackgroundColor: const Color(0xFFEFF1F4),
      backgroundColor: const Color(0xFFFFFFFF),
      errorColor: const Color(0xFFB00020),
      cursorColor: primaryColor,
      typography: Typography(),
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8,
      margin: EdgeInsets.all(0),
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
