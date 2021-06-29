import 'package:flutter/cupertino.dart';

class EventModel {
  int id;
  String eventTitle;
  String eventDescription;
  String eventDate;
  String eventType;
  String preferAlarm;
  String eventPriority;
  String eventCategory;
  String eventCreatedTime;

  EventModel(
      {this.id,
      @required this.eventTitle,
      @required this.eventDescription,
      @required this.eventDate,
      @required this.eventType,
      @required this.eventPriority,
      @required this.preferAlarm,
      @required this.eventCategory,
      @required this.eventCreatedTime});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    eventTitle = json["eventTitle"];
    eventDescription = json["eventDescription"];
    eventDate = json["eventDate"];
    eventType = json["eventType"];
    eventPriority = json["eventPriority"];
    preferAlarm = json["preferAlarm"];
    eventCategory = json["eventCategory"];
    eventCreatedTime = json["eventCreatedTime"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> event = Map<String, dynamic>();
    event["id"] = this.id;
    event["eventTitle"] = this.eventTitle;
    event["eventDescription"] = this.eventDescription;
    event["eventDate"] = this.eventDate;
    event["eventType"] = this.eventType;
    event["eventPriority"] = this.eventPriority;
    event["preferAlarm"] = this.preferAlarm;
    event["eventCategory"] = this.eventCategory;
    event["eventCreatedTime"] = this.eventCreatedTime;

    return event;
  }
}
