import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferAlarm extends StatefulWidget {
  @override
  _PreferAlarmState createState() => _PreferAlarmState();
}

class _PreferAlarmState extends State<PreferAlarm> {
  List<String> allCategory = ["Yes", "No"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      child: Wrap(
        spacing: 8.w,
        children: List.generate(allCategory.length, (int index) {
          return ChoiceChip(
              selectedColor: kAccentColor,
              label: Text(
                allCategory[index],
                style: kListTileStyle,
              ),
              selected: true);
        }),
      ),
    );
  }
}
