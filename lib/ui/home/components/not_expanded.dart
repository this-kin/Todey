import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/widgets/item_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotExpanded extends StatelessWidget {
  final String eventTitle;
  final String eventNote;
  final String eventCategory;
  final String eventCreatedDate;
  final int eventIndex;
  final int eventId;
  final String eventType;

  const NotExpanded(
      {Key key,
      this.eventTitle,
      this.eventNote,
      this.eventCategory,
      this.eventCreatedDate,
      this.eventIndex,
      this.eventId,
      this.eventType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///Circular event avatar 
            ItemAvatar(
              title: eventType,
              image: _getAvatar(eventType),
              //switch case
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Event Title
                Container(
                  width: 100.w,
                  height: 20.h,
                  child: Text(
                    eventTitle,
                    overflow: TextOverflow.fade,
                    textScaleFactor: 0.7,
                    style: TextStyle(
                        color: kTextColor, fontFamily: "Raleway", fontSize: 18),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                //Event Notes 
                Container(
                  width: 120.w,
                  height: 20.h,
                  child: Text(
                    eventNote,
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
            Text(eventCreatedDate, style: kItemWidgetStyle)
          ],
        ));
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
