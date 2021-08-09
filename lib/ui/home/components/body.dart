import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/ui/home/components/item_widget.dart';
import 'package:todey/utils/formatted_date.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomeBody extends StatefulWidget {
  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
  EventController controller = Get.put(EventController());

  //build widgets this widget will will be displayed if db aint empty
  Widget viewEvents() {
    return Container(
      child: ListView.builder(
        itemCount: controller.events.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(8.0.w),
              child: GetX<EventController>(
                builder: (controller) {
                  //Item widget from db
                  return ItemWidget(
                      eventId: controller.events[index].id,
                      eventTitle: controller.events[index].eventTitle,
                      eventNote: controller.events[index].eventNote,
                      eventCategory: controller.events[index].eventCategory,
                      eventCreatedDate:
                          controller.events[index].eventCreatedDate,
                      eventStartedTime:
                          controller.events[index].eventStartedDate,
                      eventEndedTime: controller.events[index].eventEndedDate,
                      eventIndex: index,
                      eventType: controller.events[index].eventType,
                      eventDate: controller.events[index].eventDate);
                },
              ));
        },
      ),
    );
  }

  Widget emptyEvents() {
    return Center(
      child: Opacity(
        opacity: 0.2,
        child: Container(
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/paper.png"))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formattedNow(),
            style: styleText(theme),
          ),

          ///responsiveness 0
          SizedBox(height: 30.h),
          Flexible(
            child: Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Obx(
                  () =>
                      controller.events.isEmpty ? emptyEvents() : viewEvents(),
                )),
          )
        ],
      ),
    );
  }

  TextStyle styleText(ThemeData theme) {
    return TextStyle(
      color: theme.primaryColor,
      fontFamily: "Raleway",
      fontSize: 25.sp,
    );
  }
}
