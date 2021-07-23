import 'package:flutter/material.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/category.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/date_picker.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/time_pickers.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirstSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            PickerDate(),
            Text('choose_time'.tr, style: kListTileStyle),
            SizedBox(height: 10.h),
            CustomTimePickers(),
            SizedBox(height: 20.h),
            Text('event_cat'.tr, style: kListTileStyle),
            SizedBox(height: 10.h),
            Category(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
