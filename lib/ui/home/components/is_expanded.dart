import 'package:flutter/material.dart';

class ISExpanded extends StatelessWidget {
  final String eventTitle;
  final String eventNote;
  final String eventCategory;
  final String eventCreatedDate;
  final int eventIndex;
  final int eventId;
  final String eventStartedTime;
  final String eventEndedTime;
  final String eventType;

  const ISExpanded(
      {Key key,
      this.eventTitle,
      this.eventNote,
      this.eventCategory,
      this.eventCreatedDate,
      this.eventIndex,
      this.eventId,
      this.eventStartedTime,
      this.eventEndedTime,
      this.eventType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}

_getAvatar(String eventType) {
  switch (eventType) {
    case "Fun":
      return "images/games.png";
      break;
    case "Academic":
      return "images/studying.png";
      break;
    case "Personal":
      return "images/user.png";
      break;
    case "Family":
      return "images/home.png";
      break;
    case "Work":
      return "images/suitcase.png";
      break;
    default:
  }
}
