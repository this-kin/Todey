import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: theme.primaryColor, width: 0.3))),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 35.h),
            Text(
              "Settings",
              style: kAppBarTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
