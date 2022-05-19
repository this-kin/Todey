import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todey/controllers/item_controller.dart';

class FirstComponent extends StatefulWidget {
  const FirstComponent({Key key}) : super(key: key);

  @override
  _FirstComponentState createState() => _FirstComponentState();
}

class _FirstComponentState extends State<FirstComponent> {
  //
  int _selected = 0;

  //
  DateTime _now = DateTime.now();

  //
  List<String> category = ["Important", "Planned"];

  //
  final EventController _con = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SfDateRangePicker(
                backgroundColor: theme.backgroundColor,
                selectionColor: theme.primaryColor,
                todayHighlightColor: theme.primaryColor,
                selectionTextStyle:
                    theme.textTheme.headline4.copyWith(color: Colors.white),
                minDate: _now,
                maxDate: _now.add(const Duration(days: 1000)),
                onSelectionChanged: (selectedDate) {
                  _con.eventDate.value = selectedDate.value;
                },
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: theme.textTheme.headline4,
                ),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: theme.textTheme.subtitle2,
                  disabledDatesTextStyle: theme.textTheme.headline4.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Start Time",
                  style: theme.textTheme.headline4,
                ),
                SizedBox(width: 60.w),
                Text(
                  "End Time",
                  style: theme.textTheme.headline4,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Obx(
              () => Row(
                children: [
                  customChips(
                    date: _con.eventStartedTime.value,
                    onPressed: () async {
                      final time = TimeOfDay.now();
                      _con.eventStartedTime.value = await showTimePicker(
                        context: context,
                        initialTime: time,
                      );
                    },
                  ),
                  SizedBox(width: 25.w),
                  customChips(
                    date: _con.eventEndedTime.value,
                    onPressed: () async {
                      final time = TimeOfDay.now();
                      _con.eventEndedTime.value = await showTimePicker(
                        context: context,
                        initialTime: time,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Category",
              style: theme.textTheme.headline4,
            ),
            SizedBox(height: 8.h),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 15.w,
              children: List.generate(
                2,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = index;
                      _con.eventCategory.value = category[_selected];
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: index == _selected
                          ? theme.primaryColor
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        category[index],
                        style: TextStyle(
                          color:
                              index == _selected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//

  Future<TimeOfDay> timePicker() async {
    var time = TimeOfDay.now();
    var result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null && result != time) {
      return result;
    } else {
      //
    }
    return result;
  }

  customChips({TimeOfDay date, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FontAwesome5.clock, size: 20.sp),
            Text(
              date.format(context),
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget indicatorWidget() {
    return Container(
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.sp),
      ),
    );
  }
}
