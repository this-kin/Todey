import 'package:flutter/material.dart';

class KSwitch extends StatefulWidget {
  @override
  _KSwitchState createState() => _KSwitchState();
}

class _KSwitchState extends State<KSwitch> {
  bool _isTrue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: _isTrue,
        onChanged: (bool value) {
          setState(() {
            _isTrue = value;
          });
        },
      ),
    );
  }
}
