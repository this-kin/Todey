import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/widgets/item_avatar.dart';
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
      this.eventIndex})
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
              height: isClicked ? 90.h : 75.h,
              width: 325.w,
              color: Colors.amberAccent,
            )));
  }

  deleteContainer() {
    return Container(
      color: kDeletedColor,
      child: Icon(AntDesign.delete),
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
