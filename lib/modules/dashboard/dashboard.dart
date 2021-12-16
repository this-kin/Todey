import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:todey/services/auth_service.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/formatted_date.dart';
import 'package:todey/widgets/user_avatar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //
  final AuthService _con = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: "Todey ",
            style: theme.textTheme.headline2,
            children: [
              TextSpan(
                text: "Schedule".tr,
                style: theme.textTheme.headline2,
              )
            ],
          ),
        ),
        actions: [
          UserAvatar(
            imgUrl: _con.user.photoURL,
          ),
          SizedBox(width: 20.w)
        ],
      ),
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedNow(),
              style: theme.textTheme.headline3.copyWith(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 30.h),
            DatePicker(
              DateTime.now(),
              selectionColor: theme.primaryColor,
              selectedTextColor: Colors.white,
              deactivatedColor: Colors.grey.withOpacity(0.3),
              onDateChange: (currentDate) {},
              initialSelectedDate: DateTime.now(),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: Container(
                child: Center(
                  child: Image.asset(
                    ConstanceData.paperIcon,
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
              ),
            )
            // Flexible(
            //   child: ListView.builder(
            //     itemCount: 0,
            //     itemBuilder: (_, index) {
            //       return TodoWidget();
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

//on tap of user avatar glow avatar (animation)
