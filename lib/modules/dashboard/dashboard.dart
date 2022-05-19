// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:todey/utils/exports.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //
  final AuthService _con = Get.put(AuthService());
  final EventController _event = Get.put(EventController());

  @override
  void initState() {
    _event.onReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: "Todey ",
            style: theme.textTheme.headline2,
            children: [
              TextSpan(
                text: "Schedule".tr,
                style: theme.textTheme.headline2,
              )
            ],
          ),
        ),
        actions: [
          UserAvatar(
            imgUrl: _con.user.photoURL,
          ),
          SizedBox(width: 20.w)
        ],
      ),
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedNow(),
              style: theme.textTheme.headline3.copyWith(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 30.h),
            DatePicker(
              DateTime.now(),
              selectionColor: theme.primaryColor,
              selectedTextColor: Colors.white,
              deactivatedColor: Colors.grey.withOpacity(0.3),
              onDateChange: (currentDate) {},
              initialSelectedDate: DateTime.now(),
            ),
            SizedBox(height: 30.h),
            Flexible(
              child: Container(
                // margin: EdgeInsets.only(right: 10.w),
                child: Obx(
                  () => _event.events.isEmpty
                      ? EmptyWidget()
                      : Container(
                          child: ListView.builder(
                            itemCount: _event.events.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GetX<EventController>(
                                // ignore: missing_return
                                builder: (controller) {
                                  final snapshot = controller.events[index];
                                  for (final item in controller.events.value)
                                    return Dismissible(
                                      onDismissed: (direction) {
                                        // delete events
                                        _event.deleteEvent(
                                            id: snapshot.id, index: index);
                                        _event.events.value.removeAt(index);
                                        setState(() {});
                                      },
                                      background: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: kDeletedColor,
                                          alignment: Alignment.center,
                                          child: Icon(
                                            CupertinoIcons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      key: ValueKey(index),
                                      child: TextWidget(
                                        eventCategory: snapshot.eventCategory,
                                        eventCreatedDate:
                                            snapshot.eventCreatedDate,
                                        eventId: snapshot.id,
                                        eventIndex: index,
                                        eventNote: snapshot.eventNote,
                                        eventTitle: snapshot.eventTitle,
                                        eventType: snapshot.eventType,
                                      ),
                                    );
                                },
                              );
                            },
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
