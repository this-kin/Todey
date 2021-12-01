import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Create extends StatefulWidget {
  const Create({Key key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  DateTime _now = DateTime.now();

  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor.withOpacity(0.5),
      body: Stack(
        children: [
          Positioned.fill(
            child: Material(
              elevation: 10,
              color: theme.backgroundColor.withOpacity(0.5),
              child: DraggableScrollableSheet(
                maxChildSize: 1.0,
                initialChildSize: 0.85,
                minChildSize: 0.85,
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.sp),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        indicatorWidget(),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 55.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.close),
                            ),
                            Text("New Task", style: theme.textTheme.headline4),
                            Container(
                              height: 55.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.blue.shade700,
                                      Colors.blueAccent.withOpacity(0.7)
                                    ]),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        pageIndicator(),
                        SizedBox(height: 15.h),
                        Container(
                          child: SfDateRangePicker(
                            backgroundColor: theme.backgroundColor,
                            selectionColor: theme.primaryColor,
                            todayHighlightColor: theme.primaryColor,
                            selectionTextStyle: theme.textTheme.headline4
                                .copyWith(color: Colors.white),
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
                            SizedBox(width: 50.w),
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
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  customChips({TimeOfDay date, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: 90.w,
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

  Container pageIndicator() {
    return Container(
      height: 20.h,
      width: 400.w,
    );
  }
}
