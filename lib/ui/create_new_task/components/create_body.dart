import 'package:flutter/material.dart';
import 'package:todey/ui/create_new_task/components/add_subtask.dart';
import 'package:todey/ui/create_new_task/components/category_picker.dart';
import 'package:todey/ui/create_new_task/components/date_time_picker.dart';
import 'package:todey/ui/create_new_task/components/event_description.dart';
import 'package:todey/ui/create_new_task/components/priority.dart';
import 'package:todey/ui/create_new_task/components/set_alarm.dart';
import 'package:todey/utils/constant.dart';

class CreateBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text("Description", style: kAccentStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              // child: Description(),
            ),
            SizedBox(height: height * 0.04),
            Text("Priority", style: kAccentStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Priority(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Categorys(),
            ),
            SizedBox(height: height * 0.02),
            Text("Due Date", style: kAccentStyle),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DateTimer(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SetAlarm(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SubTask(),
            ),
          ],
        ),
      ),
    );
  }
}
