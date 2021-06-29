import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';

class Description extends StatelessWidget {
  final TextEditingController textEditingController;

  const Description({Key key, @required this.textEditingController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.07,
      decoration: BoxDecoration(
          color: kBackGroundColor2, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          controller: textEditingController,
          style: kSwitchStyle,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
              hintText: "Go to the Gym",
              hintStyle: kSwitchStyle),
        ),
      ),
    );
  }
}
