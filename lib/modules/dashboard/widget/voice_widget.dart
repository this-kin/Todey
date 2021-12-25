import 'package:flutter/material.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget({Key key}) : super(key: key);

  @override
  _VoiceWidgetState createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
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
