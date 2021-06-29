import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/utils/constant.dart';

class SubTask extends StatelessWidget {
  final TextEditingController controller;

  const SubTask({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //set theme
    var theme = Theme.of(context);
//get screen responsiveness
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.25,
      decoration: BoxDecoration(
          color: theme.accentColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        style: kListTileStyle,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: "Add a note",
            border: InputBorder.none,
            hintStyle: kPrimaryStyle),
      ),
    );
  }
}
