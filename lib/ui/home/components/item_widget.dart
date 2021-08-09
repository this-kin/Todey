import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/ui/home/components/is_expanded.dart';
import 'package:todey/ui/home/components/not_expanded.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatefulWidget {
  final String eventTitle;
  final String eventNote;
  final String eventCategory;
  final String eventCreatedDate;
  final int eventIndex;
  final int eventId;
  final String eventStartedTime;
  final String eventEndedTime;
  final String eventType;
  final String eventDate;
  const ItemWidget(
      {Key key,
      this.eventId,
      this.eventTitle,
      this.eventNote,
      this.eventCategory,
      this.eventCreatedDate,
      this.eventStartedTime,
      this.eventEndedTime,
      this.eventType,
      this.eventIndex,
      @required this.eventDate})
      : super(key: key);
  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  ///
  bool isClicked = false;

  //Dependecy injextion
  EventController controller = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Dismissible(
            background: deleteContainer(),
            onDismissed: (direction) {
              //delete event
              controller.removeEvent(
                  id: widget.eventId, index: widget.eventIndex);
            },
            key: Key(widget.eventId.toString()),
            child: AnimatedContainer(
                duration: kDuration,
                height: isClicked ? 120.h : 90.h,
                width: 325.w,
                decoration: BoxDecoration(
                    color: widget.eventCategory == "Important"
                        ? kImportantColor
                        : kPlanedColor,
                    borderRadius: BorderRadius.circular(15)),
                ////////
                ///
                child: isClicked

                    ///willl be displayed if is clicked (Expnaded)
                    ? ISExpanded(
                        eventDate: widget.eventDate,
                        eventCategory: widget.eventCategory,
                        eventCreatedDate: widget.eventCreatedDate,
                        eventEndedTime: widget.eventEndedTime,
                        eventId: widget.eventId,
                        eventIndex: widget.eventIndex,
                        eventNote: widget.eventNote,
                        eventStartedTime: widget.eventStartedTime,
                        eventTitle: widget.eventTitle,
                        eventType: widget.eventType,
                      )

                    ///willl be displayed if is not clicked (Not Expanded)
                    : NotExpanded(
                        eventTitle: widget.eventTitle,
                        eventCategory: widget.eventCategory,
                        eventCreatedDate: widget.eventCreatedDate,
                        eventId: widget.eventId,
                        eventIndex: widget.eventIndex,
                        eventNote: widget.eventNote,
                        eventType: widget.eventType,
                      ))));
  }

  deleteContainer() {
    return Container(
      color: kDeletedColor,
      child: Icon(AntDesign.delete),
    );
  }
}
