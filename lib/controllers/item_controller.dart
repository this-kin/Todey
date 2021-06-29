import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/models/todo_model.dart';

class EventController extends GetxController {
  SQFliteDB sqFliteDB = SQFliteDB();
  final eventList = [].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getEvents();
  }

  Future<void> addEvent(EventModel eventModel) async {
    await sqFliteDB.saveEvent(eventModel);
    getEvents();
  }

  Future<void> getEvents() async {
    List<Map<String, dynamic>> events = await sqFliteDB.getAllEvent();
    eventList.assignAll(events.map((data) {
      EventModel.fromJson(data);
    }).toList());
  }

  // Future<void> removeEvent({EventModel event}) async {
  //   await sqFliteDB.deleteEvent(event);
  // }

  Future<void> updateEvent(EventModel event) async {
    await sqFliteDB.updateEvent(event);
    getEvents();
  }
}
