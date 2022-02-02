import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/core/sqflite_db.dart';
import 'package:todey/models/todo_model.dart';
import 'package:todey/utils/helper.dart';

class EventController extends GetxController {
  var dateNow = DateTime.now();
  var timeNow = TimeOfDay.now();
  SQFliteDB sqFliteDB = SQFliteDB();
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
    print("events length : ${events.length.toString()}");
  }

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
      await sqFliteDB.saveEvent(model).then((value) {
        print(value);
      });
    } else {
      //
    }
  }

  Future<void> getEvents() async {
    events.value = await sqFliteDB.getAllEvent();
    update();
  }

  Future<void> deleteEvent({int id, index}) async {
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

  /// FIRES WHEN YOU CLICK ON THE NOTIFICATION
  onNotificationClick(String payload) {
    print("fuck offf ");
  }

  // Future<String> pickImage() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     allowedExtensions: <String>["png", "jpeg", "jpg"],
  //     type: FileType.custom,
  //   );
  //   if (result != null) {
  //     print(result.files[0].name);
  //   }
  // }
}
