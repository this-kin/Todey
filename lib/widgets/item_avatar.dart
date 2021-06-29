import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';

class ItemAvatar extends StatelessWidget {
  final String image;

  const ItemAvatar({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.05,
      width: height * 0.05,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kTextColor,
          image: DecorationImage(image: AssetImage(image))),
    );
  }
}
