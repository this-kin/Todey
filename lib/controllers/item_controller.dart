import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/data/models/todo_model.dart';
import 'package:todey/data/sqflite_db.dart';
import 'package:todey/services/notification_service.dart';
import 'package:todey/utils/helper.dart';

class EventController extends GetxController {
  var dateNow = DateTime.now();
  var timeNow = TimeOfDay.now();
  DatabaseHelper _databaseHelper = DatabaseHelper();
  var events = <EventModel>[].obs;
  var titleController = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var eventCategory = "Important".obs;
  var eventCreatedDate = formattedNow();
  var eventDate = DateTime.now().obs;
  var eventStartedTime = TimeOfDay.now().obs;
  var eventEndedTime = TimeOfDay.now().obs;
  var eventType = "Personal".obs;
  var isRecording = false.obs;
  var eventAttachment = "";

  @override
  void onReady() {
    super.onReady();
    getEvents();
    endedNotification.setOnNotificationClick(onNotificationClick);
  }

  static final EventController instance = Get.put(EventController());

  /// CREATE  EVENT
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
        eventAttachment: eventAttachment,
      );
      await _databaseHelper.saveEvent(model).then((value) {
        var now = eventDate.value;
        var start = eventStartedTime.value;
        var end = eventEndedTime.value;
        var startedDate =
            DateTime(now.year, now.month, now.day, start.hour, start.minute);
        var endedDate =
            DateTime(now.year, now.month, now.day, end.hour, end.minute);
        endedNotification.startScheduleNotification(startedDate);
        endedNotification.endScheduleNotification(endedDate);
        disposeControllers();
      });
    } else {
      //
    }
  }

  Future<void> getEvents() async {
    events.value = await _databaseHelper.getAllEvent();
    update();
  }

  Future<void> deleteEvent({int id, index}) async {
    await _databaseHelper.deleteEvent(id);
    // events.value.removeAt(index);
    update();
    getEvents();
  }

  Future<void> updateEvent(EventModel event) async {
    await _databaseHelper.updateEvent(event);
    getEvents();
  }

  Future<void> closeDatabase() async {
    await _databaseHelper.clearDB();
  }

  /// FIRES WHEN YOU CLICK ON THE NOTIFICATION
  onNotificationClick(String payload) {
    // l
  }

  void disposeControllers() {
    noteController.value.clear();
    titleController.value.clear();
  }
}
