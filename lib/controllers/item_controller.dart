import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todey/core/sqflite_db.dart';
import 'package:todey/models/todo_model.dart';
import 'package:todey/utils/formatted_date.dart';
import 'dart:io' as io;

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
        eventAttachment: 'testerment.com',
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

  Future recordAudio() async {
    bool permission = await FlutterAudioRecorder2.hasPermissions;

    if (permission) {
      String customPath = '/flutter_audio_recorder_';
      io.Directory appDocDirectory;

      if (io.Platform.isIOS) {
        appDocDirectory = await getApplicationDocumentsDirectory();
      } else {
        appDocDirectory = (await getExternalStorageDirectory());
      }
      final path = appDocDirectory.path +
          customPath +
          DateTime.now().millisecondsSinceEpoch.toString();
      var recorder = FlutterAudioRecorder2(path, audioFormat: AudioFormat.WAV);
      await recorder.initialized;
      var current = await recorder.current(channel: 0);

      print(current.status);
    }
  }

  void _disposeControllers() {
    noteController.value.clear();
    titleController.value.clear();
  }
}
