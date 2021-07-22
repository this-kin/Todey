import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/services/notification_service.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/models/todo_model.dart';
import 'package:todey/services/toast_service.dart';
import 'package:todey/ui/home/home_page.dart';
import 'package:todey/utils/formatted_date.dart';
import 'package:todey/utils/helper.dart';

class EventController extends GetxController {
  var dateNow = DateTime.now();
  var timeNow = TimeOfDay.now();
  SQFliteDB sqFliteDB = SQFliteDB();
  var events = List<EventModel>().obs;
  var pageController = PageController().obs;
  var titleController = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var eventCategory = "Important".obs;
  var eventCreatedDate = formattedDate();
  var eventDate = DateTime.now().obs;
  var eventStartedTime = TimeOfDay.now().obs;
  var eventEndedTime = TimeOfDay.now().obs;
  var eventType = "Personal".obs;
  var selectedIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    getEvents();
    notification.setOnNotificationClick(onNotificationClick);
  }

  onNotificationClick(String payload) {
    print("fuck offf ");
  }

  Future<void> addEvent(BuildContext context) async {
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
    getEvents();
    titleController.value.clear();
    noteController.value.clear();
    selectedIndex.value = 0;

    Helper.nextScreen(context, HomePage());
  }

  Future<void> getEvents() async {
    events.value = await sqFliteDB.getAllEvent();
    update();
  }

  Future<void> removeEvent({int id, index}) async {
    await sqFliteDB.deleteEvent(id);
    events.removeAt(index);
    update();
    getEvents();
  }

  Future<void> updateEvent(EventModel event) async {
    await sqFliteDB.updateEvent(event);
    getEvents();
  }

  checkValue(BuildContext context) {
    if (titleController.value.text.isNotEmpty &&
        noteController.value.text.isNotEmpty) {
      print("Not Empty");
      //xcellent

      var date = DateTime(
          eventDate.value.year,
          eventDate.value.month,
          eventDate.value.day,
          eventStartedTime.value.hour,
          eventStartedTime.value.minute);
      print(date);
      notification.startScheduleNotification(date);
      print("Today's Date is ${DateTime.now()}");
    } else {
      ShowToast.checkEvent(context);
    }
  }

  Future<void> clearAllEvents() async {
    // clear all data entered by userrrr
  }
}
