import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
      child: Container(
        height: 50.h,
        width: 325.w,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            SizedBox(width: 20.w),
            Text(
              btnText,
              style: theme.textTheme.headline5,
            ),
            SizedBox(width: 160.w),
            Container(
              child: trailing,
            )
          ],
        ),
      ),
    );
  }
}
