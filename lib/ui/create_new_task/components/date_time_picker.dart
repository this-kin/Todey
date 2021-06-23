import 'package:flutter/material.dart';
import 'package:todey/widgets/date_picker.dart';

class DateTimer extends StatefulWidget {
  @override
  _DateTimerState createState() => _DateTimerState();
}

class _DateTimerState extends State<DateTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        children: [
          PickDate(
            value: "15 August",
            onPressed: () {
              //date picker
            },
          ),
          PickDate(
            value: "7:00 AM",
            onPressed: () {
              //time picker
            },
          )
        ],
      ),
    );
  }
}
