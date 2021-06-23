import 'package:flutter/material.dart';
import 'package:todey/ui/settings/components/body.dart';
import 'package:todey/utils/theme.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    //date time button will be from the boat ui
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        title: Text(
          "Settings",
          style: styleText(),
        ),
      ),
      body: SetBody(),
    );
  }

  TextStyle styleText() {
    return TextStyle(color: txtColor, fontFamily: "Raleway", fontSize: 25);
  }
}
