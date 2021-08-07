import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
  return CupertinoActionSheet(
    title: Text("User"),
    message: Text("User"),
    actions: [
      Container(
          height: 50,
          child: Center(
            child: Text("Center"),
          ))
    ],
  );
}

