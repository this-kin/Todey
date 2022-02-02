import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String eventTitle;
  final String eventNote;
  final String eventCategory;
  final String eventCreatedDate;
  final int eventIndex;
  final int eventId;
  final String eventType;
  final String eventAttachment;

  const ImageWidget({
    Key key,
    this.eventTitle,
    this.eventNote,
    this.eventCategory,
    this.eventCreatedDate,
    this.eventIndex,
    this.eventId,
    this.eventType,
    this.eventAttachment,
  }) : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: widget.key,
        child: Container(),
      ),
    );
  }
}
