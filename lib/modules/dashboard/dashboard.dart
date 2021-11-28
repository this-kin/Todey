import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:todey/core/sharepreference_helper.dart';
import 'package:todey/utils/formatted_date.dart';
import 'package:todey/widgets/user_avatar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    loadSharedPF();
  }

  var imageUrl = "";
  void loadSharedPF() async {
    imageUrl = await SharedPreferenceHelper.getUserimage();
    print('===========> $imageUrl ===========>');
  }

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
            imgUrl: imageUrl,
          ),
          SizedBox(width: 20.w)
        ],
      ),
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text(
              formattedNow(),
              style: theme.textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
