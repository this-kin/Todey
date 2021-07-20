import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String btnText;
  final Widget trailing;
  final Function onPressed;

  const SettingTile(
      {Key key, this.icon, this.btnText, this.trailing, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
      child: Container(
        height: 50.h,
        width: 325.w,
        child: Center(
          child: Row(
            children: [
              Icon(
                icon,
                color: kIconColor,
                size: 25.sp,
              ),
              SizedBox(width: 10.w),
              Text(btnText, style: kSettingStyle()),
              Spacer(),
              trailing
            ],
          ),
        ),
      ),
    );
  }

  kSettingStyle() {
    return TextStyle(
      fontSize: 14.sp,
      fontFamily: "MADType",
      fontWeight: FontWeight.w400,
      color: kSettingColor,
    );
  }
}
