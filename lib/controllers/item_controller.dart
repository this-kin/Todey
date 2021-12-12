import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/services/notification_service.dart';
import 'package:todey/core/sqflite_db.dart';
import 'package:todey/models/todo_model.dart';
import 'package:todey/services/start_notification.dart';
import 'package:todey/services/toast_service.dart';
import 'package:todey/utils/formatted_date.dart';

class EventController extends GetxController {
  var dateNow = DateTime.now();
  var timeNow = TimeOfDay.now();
  SQFliteDB sqFliteDB = SQFliteDB();
  var events = List<EventModel>().obs;
  var pageController = PageController().obs;
  var titleController = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var eventCategory = "Important".obs;
  var eventCreatedDate = formattedNow();
  var eventDate = DateTime.now().obs;
  var eventStartedTime = TimeOfDay.now().obs;
  var eventEndedTime = TimeOfDay.now().obs;
  var eventType = "Personal".obs;
  var selectedIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    getEvents();
    endedNotification.setOnNotificationClick(onNotificationClick);
    startNotification.setOnNotificationClick(onStartClick);
  }

  /////////////////////CREATE  EVENT
  Future<void> addEvent(BuildContext context) async {
    if (titleController.value.text.isNotEmpty &&
        noteController.value.text.isNotEmpty) {
      EventModel model = EventModel(
          eventCategory: eventCategory.value,
          eventCreatedDate: eventCreatedDate,
          eventDate: eventDate.value.toString(),
          eventEndedDate: eventEndedTime.value.toString(),
          eventNote: noteController.value.text,
          eventTitle: titleController.value.text,
          eventStartedDate: eventStartedTime.value.toString(),
          eventType: eventType.value);
      await sqFliteDB.saveEvent(model);
      setNotification(
          eventDate.value, eventStartedTime.value, eventEndedTime.value);
      getEvents();
      _disposeController();

      Navigator.pop(context);
    } else {
      ShowToast.checkEvent(context);
    }
  }

///////// FETCH ALL EVENT
  Future<void> getEvents() async {
    events.value = await sqFliteDB.getAllEvent();
    update();
  }

///////////// DElETE EVENT
  Future<void> removeEvent({int id, index}) async {
    await sqFliteDB.deleteEvent(id);

    events.removeAt(index);
    update();
    getEvents();
  }

/////////////UPDATE EVENT
  Future<void> updateEvent(EventModel event) async {
    await sqFliteDB.updateEvent(event);
    getEvents();
  }

////////////CLEARS ALL
  Future<void> clearAllEvents() async {
    // clear all data entered by userrrr
  }

  /////////  FIRES WHEN YOU CLICK ON THE NOTIFICATION
  onNotificationClick(String payload) {
    print("fuck offf ");
  }

  _disposeController() {
    noteController.value.clear();
    titleController.value.clear();
    selectedIndex.value = 0;
  }

  ////to set scheduled notification
  setNotification(DateTime eventDate, TimeOfDay eventStartedTime,
      TimeOfDay eventEndedTime) {
    var now = eventDate;
    var start = eventStartedTime;
    var end = eventEndedTime;

//Start Time
    var startedDate =
        DateTime(now.year, now.month, now.day, start.hour, start.minute);
    startNotification.startScheduleNotification(startedDate);
    print(startedDate);

//End Time
    var endedDate =
        DateTime(now.year, now.month, now.day, end.hour, end.minute);

    endedNotification.endScheduleNotification(endedDate);
    print(endedDate);
  }

  onStartClick() {
    print("start notification clicked");
  }
}
