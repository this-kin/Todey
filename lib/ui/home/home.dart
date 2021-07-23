import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/ui/home/components/body.dart';
import 'package:todey/utils/constant.dart';

import 'package:todey/widgets/user_avatar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AuthService authServiceController = Get.put(AuthService());
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        title: RichText(
          text: TextSpan(text: "Todey ", style: kAppBarTitleStyle, children: [
            TextSpan(
              text: 'schedule'.tr,
              style: kAppBarTitleStyle,
            )
          ]),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: Obx(() => UserAvatar(
                    imgUrl: authServiceController.userImageUrl.value,
                  ))),
          SizedBox(
            width: width * 0.03,
          )
        ],
      ),
      backgroundColor: theme.backgroundColor,
      body: MyHomeBody(),
    );
  }
}
