import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/utils/formatted_date.dart';

class EventData extends GetxController {
  var titleController = TextEditingController().obs;
  var noteController = TextEditingController().obs;
  var eventCategory = "".obs;
  var eventCreatedDate = formattedDate();
  var eventDate = "".obs;
  var eventStartedTime = "".obs;
  var eventEndedTime = "".obs;
  var eventType = "".obs;
  var selectedIndex = 0.obs;

  initialise() {
    titleController.value.clear();
    noteController.value.clear();
    eventCategory.value = "Important";
    eventDate.value = DateTime.now() as String;
    eventStartedTime.value = TimeOfDay.now() as String; //
    eventEndedTime.value = TimeOfDay.now() as String; //
    eventType.value = "Personal";
    selectedIndex.value = 0;
  }
}
