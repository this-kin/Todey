import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/models/language_models.dart';
import 'package:todey/utils/constant.dart';

class KBottom extends StatelessWidget {
  //build widgets
  buildTile({String title, Function onPressed, Widget trailing}) {
    return Container(
      height: 65.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kSettingStyle(),
          ),
          trailing
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    return Container(
      height: 250.h,
      color: theme.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Lannguage",
              style: kSelectStyle(),
            ),
            SizedBox(height: 10.h),
            Flexible(
                child: ListView.builder(
              itemCount: allLang.length,
              itemBuilder: (BuildContext context, int index) {
                return buildTile(
                    title: allLang[index].title,
                    onPressed: allLang[index].onPressed,
                    trailing: index == 0 ? Icon(Icons.check) : Container());
              },
            ))
          ],
        ),
      ),
    );
  }

  kSelectStyle() {
    return TextStyle(
      fontSize: 18.sp,
      color: Colors.white,
      fontFamily: "Raleway",
      fontWeight: FontWeight.w500,
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
