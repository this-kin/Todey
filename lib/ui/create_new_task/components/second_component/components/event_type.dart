import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/models/event_type_model.dart';
import 'package:todey/utils/constant.dart';

class EventType extends StatefulWidget {
  @override
  _EventTypeState createState() => _EventTypeState();
}

class _EventTypeState extends State<EventType> {
  EventController controller = Get.put(EventController());

  int selectedIndex = 0;

  //build widget

  Widget buildChips({String imgurl, Color borderColor, String txt}) {
    return AnimatedContainer(
      duration: kDuration,
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor), shape: BoxShape.circle),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: CircleAvatar(
          radius: 25.sp,
          backgroundColor: themeData.backgroundColor,
          child: Image.asset(imgurl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        child: Wrap(
          spacing: 10.w,
          children: List<Widget>.generate(allEventTypes.length, (int index) {
            return GestureDetector(
                onTap: () {
                  print(allEventTypes[index].name);
                  selectedIndex = index;
                  controller.eventType.value =
                      allEventTypes[selectedIndex].name;
                  setState(() {});
                },
                child: buildChips(
                    imgurl: allEventTypes[index].imageurl,
                    txt: allEventTypes[index].name,
                    borderColor: selectedIndex == index
                        ? kAccentColor
                        : kBackgroundColor));
          }),
        ));
  }
}
