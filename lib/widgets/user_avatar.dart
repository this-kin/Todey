import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class UserAvatar extends StatelessWidget {
  final String imgUrl;

  UserAvatar({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  _showBottomSheet(context, theme);
      },
      child: Container(
        height: 50.h,
        width: 50.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            height: 40.h,
            width: 40.w,
            fit: BoxFit.contain,
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
          image: DecorationImage(
            image: AssetImage(ConstanceData.userIcon),
          ),
        ),
      ),
    );
  }

  // _showBottomSheet(BuildContext context, ThemeData theme) {
  //   var dialog = ClipRRect(
  //       borderRadius: BorderRadius.circular(20.sp),
  //       child: AlertDialog(
  //         elevation: 0,
  //         backgroundColor: theme.backgroundColor,
  //         title: Text("Logout", style: kLogoutStyle()),
  //         content: Container(
  //           child: Text("All events will be deleted permanently",
  //               style: kLogoutStyle()),
  //         ),
  //         actions: [
  //           FlatButton(
  //             onPressed: () {
  //               Helper.popScreen(context);
  //             },
  //             child: Text("Cancel", style: kDialogStyle()),
  //           ),
  //           FlatButton(
  //             onPressed: () {
  //               //  authService.signOut(context);
  //             },
  //             child: Text("Confirm", style: kDialogStyle()),
  //           )
  //         ],
  //       ));
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return dialog;
  //       });
  // }

  kLogoutStyle() {
    return TextStyle(
      fontFamily: 'Raleway',
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
