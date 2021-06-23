import 'package:flutter/material.dart';

class Sizer extends StatelessWidget {
  final num height;
  final num width;

  const Sizer({Key key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
