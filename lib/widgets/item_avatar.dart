import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';

class ItemAvatar extends StatelessWidget {
  final String image;
  final String title;
  const ItemAvatar({Key key, this.image, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.05,
      width: height * 0.05,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getColor(title),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Image.asset(image),
      ),
    );
  }
}

_getColor(String title) {
  switch (title) {
    case "Fun":
      return kFunColor;
      break;
    case "Family":
      return kFamilyColor;
      break;
    case "Personal":
      return kPersonalColor;
      break;
    case "Work":
      return kWorkColor;
      break;
    case "Academic":
      return kHomeColor;
      break;
    default:
      return kDefaultColor;
      break;
  }
}
