import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class UserAvatar extends StatelessWidget {
  final String imgUrl;

  const UserAvatar({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context);
      },
      child: Container(
        height: height * 0.06,
        width: height * 0.06,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            errorWidget: _errorWidget,
            progressIndicatorBuilder: _progressWidget,
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

  Widget _progressWidget(
      BuildContext context, String url, DownloadProgress progress) {
    return Container();
  }
}

_showBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 100.h,
          decoration: BoxDecoration(
              color: themeData.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: Row(
            children: [
              CircularProgressIndicator(
                backgroundColor: kImportantColor,
              ),
              SizedBox(width: 50),
              Text("Logging out and Erasing all data", style: kListTileStyle),
            ],
          ),
        );
      },
      context: context);
}
