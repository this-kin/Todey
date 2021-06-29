import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';

import 'package:todey/widgets/custom_chip.dart';

class Priority extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: height * 0.07,
        decoration: BoxDecoration(
            color: kBackGroundColor2, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Set Priority",
              style: kSwitchStyle,
            ),
            CustomChips()
          ],
        ));
  }
}
