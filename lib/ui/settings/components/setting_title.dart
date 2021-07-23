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
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Container(
            height: 50.h,
            width: 325.w,
            child: ListTile(
              leading: Icon(
                icon,
                color: Colors.white,
              ),
              title: Text(
                btnText,
                style: kSettingStyle(),
              ),
              onTap: onPressed,
              trailing: trailing,
            )));
  }

  kSettingStyle() {
    return TextStyle(
      fontSize: 15.sp,
      fontFamily: "MADType",
      fontWeight: FontWeight.w400,
      color: kSettingColor,
    );
  }
}
