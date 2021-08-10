import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/helper.dart';

class UserAvatar extends StatelessWidget {
  AuthService authService = Get.put(AuthService());

  final String imgUrl;

  UserAvatar({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context, theme);
      },
      child: Container(
        height: height * 0.06,
        width: height * 0.06,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: authService.userImageUrl.value,
            errorWidget: _errorWidget,
          ),
        ),
      ),
    );
  }

  Widget _errorWidget(BuildContext context, String url, error) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/user.png"))),
      ),
    );
  }

  _showBottomSheet(BuildContext context, ThemeData theme) {
    var dialog = AlertDialog(
      elevation: 0,
      backgroundColor: kBackGroundColor2,
      title: Text("Logout", style: kLogoutStyle()),
      content: Container(
        child: Text("All events will be deleted permanently",
            style: kCaptionStyle()),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Helper.popScreen(context);
          },
          child: Text("Cancel", style: kDialogStyle()),
        ),
        FlatButton(
          onPressed: () {
            authService.signOut(context);
          },
          child: Text("Confirm", style: kDialogStyle()),
        )
      ],
    );
    return showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  kLogoutStyle() {
    return TextStyle(
      fontFamily: 'Raleway',
      color: Colors.white,
      fontSize: 14.sp,
    );
  }

  kCaptionStyle() {
    return TextStyle(
      fontFamily: 'MADType',
      color: Colors.white,
      fontSize: 14.sp,
    );
  }

  kDialogStyle() {
    return TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14.sp,
    );
  }
}
