import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/core/sqflite_db.dart';
import 'package:todey/models/todo_model.dart';
import 'package:todey/services/toast_service.dart';
import 'package:todey/utils/formatted_date.dart';

class EventController extends GetxController {
  var dateNow = DateTime.now();
  var timeNow = TimeOfDay.now();
  SQFliteDB sqFliteDB = SQFliteDB();
  var events = <EventModel>[].obs;
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
  }

  /////////////////////CREATE  EVENT
  Future<void> createEvent(BuildContext context) async {
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
        eventType: eventType.value,
        eventAttachment: '',
      );
      await sqFliteDB.saveEvent(model);
      Navigator.pop(context);
    } else {
      ShowToast.checkEvent(context);
    }
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

  Future<void> closeDatabase() async {
    await sqFliteDB.clearDB();
  }

  /////////  FIRES WHEN YOU CLICK ON THE NOTIFICATION
  onNotificationClick(String payload) {
    print("fuck offf ");
  }

  void _disposeControllers() {
    noteController.value.clear();
    titleController.value.clear();
    selectedIndex.value = 0;
  }
}
