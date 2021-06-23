import 'package:flutter/material.dart';
import 'package:todey/ui/create_new_task/components/create_body.dart';
import 'package:todey/utils/theme.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        title: Text(
          "New Event",
          style: styleText(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //create event
            },
            icon: Icon(Icons.done_outline),
          )
        ],
      ),
      body: CreateBody(),
    );
  }

  TextStyle styleText() {
    return TextStyle(color: txtColor, fontFamily: "Raleway", fontSize: 25);
  }
}
