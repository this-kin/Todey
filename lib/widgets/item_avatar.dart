import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      return Colors.pinkAccent;
      break;
    case "Family":
      return Colors.purpleAccent;
      break;
    case "Personal":
      return Colors.white;
      break;
    case "Work":
      return Colors.tealAccent;
      break;
    default:
      return Colors.deepOrangeAccent;
      break;
  }
}
