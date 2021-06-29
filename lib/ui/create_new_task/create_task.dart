import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/models/todo_model.dart';
import 'package:todey/ui/create_new_task/components/add_subtask.dart';
import 'package:todey/ui/create_new_task/components/category_picker.dart';
import 'package:todey/ui/create_new_task/components/date_time_picker.dart';
import 'package:todey/ui/create_new_task/components/event_description.dart';
import 'package:todey/ui/create_new_task/components/priority.dart';
import 'package:todey/ui/create_new_task/components/set_alarm.dart';
import 'package:todey/utils/constant.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    //
    var height = MediaQuery.of(context).size.height;
    void _saveNewEvents(
      TextEditingController titleEditingController,
      TextEditingController subTitleController,
    ) async {
      EventModel model = EventModel(
        eventDescription: "I go like sleep ontop bridge thrid mainland oo",
        eventCategory: "Work",
        eventCreatedTime: "10:00",
        eventDate: "Tue 28",
        eventPriority: "2",
        eventTitle: "sleep ontop bridge",
        eventType: "Important",
        preferAlarm: "no",
      );
      EventController().addEvent(model);
    }

    ///
    ///
    EventController eventController = Get.put(EventController());
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController subTitleController = TextEditingController();
    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          title: Text(
            "New Event",
            style: kAppBarTitleStyle,
          ),
          actions: [
            FlatButton(
              onPressed: () {
                // save data to db...

                _saveNewEvents(titleEditingController, subTitleController);
              },
              child: Text(
                "Done",
                style: kListTileStyle,
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text("Event Title", style: kAccentStyle),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Description(
                    textEditingController: titleEditingController,
                  ),
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
                  child: SubTask(
                    controller: subTitleController,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
