import 'package:flutter/material.dart';

class VoiceWidget extends StatefulWidget {
  final String eventTitle;
  final String eventNote;
  final String eventCategory;
  final String eventCreatedDate;
  final int eventIndex;
  final int eventId;
  final String eventType;

  const VoiceWidget({
    Key key,
    this.eventTitle,
    this.eventNote,
    this.eventCategory,
    this.eventCreatedDate,
    this.eventIndex,
    this.eventId,
    this.eventType,
  }) : super(key: key);

  @override
  _VoiceWidgetState createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
