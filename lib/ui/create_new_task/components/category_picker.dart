import 'package:flutter/material.dart';
import 'package:todey/utils/theme.dart';
import 'package:todey/widgets/custom_category.dart';
import 'package:todey/widgets/date_picker.dart';

class Categorys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: height * 0.07,
        decoration: BoxDecoration(
            color: backGroundColor2, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: labelStyle(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: PickDate(
                btnText: "Work",
                value: "Work",
                onPressed: () {},
              ),
            )
          ],
        ));
  }

  TextStyle labelStyle() {
    return TextStyle(color: txtColor, fontFamily: "MADType", fontSize: 18);
  }
}
