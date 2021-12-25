import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({Key key}) : super(key: key);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: widget.key,
        child: Container(),
      ),
    );
  }
}
