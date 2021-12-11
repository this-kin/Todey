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
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: Container(
        height: 50.h,
        width: 325.w,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.grey,
          ),
          title: Text(
            btnText,
            style: theme.textTheme.headline5,
          ),
          onTap: onPressed,
          trailing: trailing,
        ),
      ),
    );
  }
}
