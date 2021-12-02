import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FirstComponent extends StatefulWidget {
  const FirstComponent({Key key}) : super(key: key);

  @override
  _FirstComponentState createState() => _FirstComponentState();
}

class _FirstComponentState extends State<FirstComponent> {
  DateTime _now = DateTime.now();

  TimeOfDay _time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Container(
            child: SfDateRangePicker(
              backgroundColor: theme.backgroundColor,
              selectionColor: theme.primaryColor,
              todayHighlightColor: theme.primaryColor,
              selectionTextStyle:
                  theme.textTheme.headline4.copyWith(color: Colors.white),
              minDate: _now,
              maxDate: _now.add(const Duration(days: 1000)),
              onSelectionChanged: (selectedDate) {},
              headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: theme.textTheme.headline4,
              ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                textStyle: theme.textTheme.headline4,
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
          SizedBox(height: 15.h),
          Row(
            children: [
              customChips(
                date: _time,
                onPressed: () {
                  //
                },
              ),
              SizedBox(width: 25.w),
              customChips(
                date: _time,
                onPressed: () {
                  //
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  customChips({TimeOfDay date, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.h,
        width: 100.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FlutterIcons.clock_faw5, size: 20.sp),
            Text(
              date.format(context),
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Container indicatorWidget() {
    return Container(
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.sp)),
    );
  }
}
