import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class TextWidget extends StatefulWidget {
  final String date;

  const TextWidget({Key key, this.date}) : super(key: key);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        // child: Dismissible(
        // key: widget.key,
        child: Container(
          height: 130.h,
          width: 360.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Column(
            children: [
              titleWidget(
                textTheme: theme.textTheme,
              ),
              SizedBox(height: 12.h),
              Container(
                child: Row(
                  children: [
                    leadingWidget(theme),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BodyBuilding ✌🤞😉😎"),
                        SizedBox(height: 10.h),
                        Wrap(
                          children: [
                            Icon(Icons.access_time_sharp),
                            Text("18:00 pm - 21: 00 pm")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }

  Container leadingWidget(ThemeData theme) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        ConstanceData.gameIcon,
        height: 40.h,
        width: 40.w,
      ),
    );
  }

  Widget titleWidget({TextTheme textTheme}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today 16:20",
            style: textTheme.subtitle2.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          Container(
            height: 15.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              gradient: LinearGradient(
                  colors: [Colors.lightBlue, Colors.blueAccent, Colors.blue]),
            ),
            alignment: Alignment.center,
            child: Text(
              "6 hours later",
              style: TextStyle(
                fontSize: 8.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
