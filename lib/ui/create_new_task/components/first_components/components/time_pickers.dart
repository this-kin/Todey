import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';

class CustomTimePickers extends StatefulWidget {
  @override
  _CustomTimePickersState createState() => _CustomTimePickersState();
}

class _CustomTimePickersState extends State<CustomTimePickers> {
  EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    customChips({TimeOfDay date, Function onPressed}) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          height: 40.h,
          width: 90.w,
          decoration: BoxDecoration(
              border: Border.all(color: kSettingColor),
              borderRadius: BorderRadius.circular(8.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(FlutterIcons.clock_faw5, size: 20.sp),
              Text(
                date.format(context),
                style: TextStyle(
                    fontSize: 14.sp,
                    color: kSettingColor,
                    fontFamily: "MADType"),
              )
            ],
          ),
        ),
      );
    }

    // pick start time
    _pickStartTime(BuildContext context) async {
      setState(() {});
      // controller.eventStartedTime.value = defaultStart.toString();
      TimeOfDay t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (t != null) {
        controller.eventStartedTime.value = t;
        print(controller.eventStartedTime.value);
      }
    }

    // pick end time
    _pickEndTime(BuildContext context) async {
      setState(() {});
      // controller.eventEndedTime.value = defaultEnd.toString();
      TimeOfDay t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (t != null) {
        controller.eventEndedTime.value = t;
        print(controller.eventEndedTime.value);
      }
    }

    return Container(
      height: 60.h,
      width: double.infinity,
      child: Row(
        children: [
          Obx(
            () => customChips(
                date: controller.eventStartedTime.value,
                onPressed: () {
                  //pick start time
                  _pickStartTime(context);
                }),
          ),
          SizedBox(width: 20.w),
          Obx(
            () => customChips(
                date: controller.eventEndedTime.value,
                onPressed: () {
                  //pick start time
                  _pickEndTime(context);
                }),
          ),
        ],
      ),
    );
  }
}
