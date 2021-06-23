import 'package:flutter/material.dart';
import 'package:todey/utils/theme.dart';

class SetAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("Alarm", style: newMethod()),
        trailing: Switch(
          activeColor: Colors.greenAccent,
          onChanged: (bool value) {},
          value: true,
        ),
      ),
    );
  }

  TextStyle newMethod() {
    return TextStyle(color: settingColor, fontFamily: "MADType", fontSize: 18);
  }
}
