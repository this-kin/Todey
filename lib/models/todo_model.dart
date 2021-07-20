import 'package:flutter/cupertino.dart';

class EventModel {
  int id;
  String eventTitle;
  String eventNote;
  String eventCreatedDate;
  String eventType;
  String eventStartedDate;
  String eventEndedDate;
  String eventCategory;
  String eventDate;
  EventModel(
      {this.id,
      @required this.eventTitle,
      @required this.eventNote,
      @required this.eventCreatedDate,
      @required this.eventType,
      @required this.eventStartedDate,
      @required this.eventEndedDate,
      @required this.eventCategory,
      @required this.eventDate});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    eventTitle = json["eventTitle"];
    eventNote = json["eventNote"];
    eventCreatedDate = json["eventCreatedDate"];
    eventType = json["eventType"];
    eventStartedDate = json["eventStartedDate"];
    eventEndedDate = json["eventEndedDate"];
    eventCategory = json["eventCategory"];
    eventDate = json["eventDate"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> event = Map<String, dynamic>();
    event["id"] = this.id;
    event["eventTitle"] = this.eventTitle;
    event["eventNote"] = this.eventNote;
    event["eventCreatedDate"] = this.eventCreatedDate;
    event["eventType"] = this.eventType;
    event["eventStartedDate"] = this.eventStartedDate;
    event["eventEndedDate"] = this.eventEndedDate;
    event["eventCategory"] = this.eventCategory;
    event["eventDate"] = this.eventDate;

    return event;
  }
}
