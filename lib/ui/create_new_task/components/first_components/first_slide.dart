import 'package:flutter/material.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/category.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/date_picker.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/time_pickers.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        PickerDate(),
        Text("Choose start time & end time", style: kListTileStyle),
        SizedBox(height: 10.h),
        CustomTimePickers(),
        SizedBox(height: 20.h),
        Text("Event Category", style: kListTileStyle),
        SizedBox(height: 10.h),
        Category(),
        SizedBox(height: 20.h),
        // Text("Prefer Alarm ", style: kListTileStyle),
        // PreferAlarm()
      ],
    );
  }
}
