import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todey/core/exports.dart';
import 'package:todey/widgets/create_widgets/custom_date.dart';

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
            Row(
              children: [
                ValueListenableBuilder<TimeOfDay>(
                    valueListenable: _con.eventStartedTime,
                    builder: (__, value, child) {
                      return CustomDateTime(
                        date: value,
                        onPressed: () async {
                          final time = TimeOfDay.now();
                          _con.eventStartedTime.value = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );
                        },
                      );
                    }),
                SizedBox(width: 25.w),
                ValueListenableBuilder(
                    valueListenable: _con.eventEndedTime,
                    builder: (context, value, child) {
                      return CustomDateTime(
                        date: value,
                        onPressed: () async {
                          final time = TimeOfDay.now();
                          _con.eventEndedTime.value = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );
                        },
                      );
                    }),
              ],
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
}
