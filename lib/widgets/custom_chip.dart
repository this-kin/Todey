import 'package:flutter/material.dart';

class CustomChips extends StatefulWidget {
  @override
  _CustomChipsState createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        //open bottom sheet
      },
      child: Container(
          height: height * 0.05,
          width: width * 0.27,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text("⭐⭐⭐⭐⭐"))),
    );
  }
}
