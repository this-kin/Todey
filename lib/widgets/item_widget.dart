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
  EventController controller = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Dismissible(
      background: deleteContainer(),
      onDismissed: (direction) {
        //delete event

        controller.removeEvent(id: widget.eventId, index: widget.eventIndex);
      },
      key: Key(widget.eventIndex.toString()),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: height / 10,
        width: width,
        decoration: BoxDecoration(
            color: widget.eventCategory == "Important"
                ? kImportantColor
                : kPlanedColor,
            borderRadius: BorderRadius.circular(15)),
        child: customListile(),
      ),
    );
  }

  Widget customListile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ItemAvatar(
          title: widget.eventType,
          image: _getAvatar(widget.eventType),
          //switch case
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 20.h,
              child: Text(
                widget.eventTitle,
                overflow: TextOverflow.fade,
                textScaleFactor: 0.7,
                style: TextStyle(
                    color: kTextColor, fontFamily: "Raleway", fontSize: 18),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              width: 120.w,
              height: 20.h,
              child: Text(
                widget.eventNote,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: kSettingColor,
                    fontFamily: "MADType",
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Text(widget.eventCreatedDate, style: kItemWidgetStyle)
      ],
    );
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
