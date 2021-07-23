import 'package:flutter/material.dart';

class KSwitch extends StatefulWidget {
  @override
  _KSwitchState createState() => _KSwitchState();
}

class _KSwitchState extends State<KSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        onChanged: (bool value) {
          setState(() {
            value = !value;
          });
        },
        value: false,
      ),
    );
  }
}
