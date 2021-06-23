import 'package:flutter/material.dart';
import 'package:todey/utils/theme.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.07,
      decoration: BoxDecoration(
          color: backGroundColor2, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          style: labelStyle(),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              border: InputBorder.none,
              hintText: "Go to the Gym",
              hintStyle: labelStyle()),
        ),
      ),
    );
  }

  TextStyle labelStyle() {
    return TextStyle(color: txtColor, fontFamily: "MADType", fontSize: 18);
  }
}
