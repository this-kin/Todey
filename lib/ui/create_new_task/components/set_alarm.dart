import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';

class SetAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("Alarm", style: kSwitchStyle),
        trailing: Switch(
          activeColor: Colors.greenAccent,
          onChanged: (bool value) {},
          value: true,
        ),
      ),
    );
  }
}
