import 'dart:io' show File, Platform;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//TZDATETIME
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

///had to create different notification helper for each event
///this is is fired when event is ended and early every night
class EndedNotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  var initializationSetting;

  EndedNotificationHelper._() {
    init();
  }

  init() async {
    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestPermissionIos();
    }

    initialisePlatFormSpec();
  }

  initialisePlatFormSpec() {
    var initializeAndrioidSetting = AndroidInitializationSettings("todey");
    var initializeIosSetting = IOSInitializationSettings(
        // configure for ios

        );
    initializationSetting = InitializationSettings(
        android: initializeAndrioidSetting, iOS: initializeIosSetting);
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

  //
  //End of the Day

  Future<void> endOfDay() async {
    var now = DateTime.now();
    var scheduledTime = Time(22, 0, 0);
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 2",
      "CHANNEL_NAME 2",
      channelDescription: "CHANNEL_DESCRIPTION 2",
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosSpecific = IOSNotificationDetails();
    var platformSpecific =
        NotificationDetails(android: andriodSpecific, iOS: iosSpecific);

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      2,
      "Todey",
      "night".tr,
      scheduledTime,
      platformSpecific,
      payload: "Test Payload",
    );
  }

  Future<void> startScheduleNotification(DateTime date) async {
    var scheduledTime =
        tz.TZDateTime.from(date, tz.local).add(Duration(minutes: 1));
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 2",
      "CHANNEL_NAME 2",
      channelDescription: "CHANNEL_DESCRIPTION 2",
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosSpecific = IOSNotificationDetails();
    var platformSpecific =
        NotificationDetails(android: andriodSpecific, iOS: iosSpecific);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        2, "Todey", "started".tr, scheduledTime, platformSpecific,
        payload: "Test Payload",
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  ///Scheduled eventEnded
  Future<void> endScheduleNotification(DateTime date) async {
    var scheduledTime =
        tz.TZDateTime.from(date, tz.local).add(Duration(minutes: 1));
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 3",
      "CHANNEL_NAME 3",
      channelDescription: "CHANNEL_DESCRIPTION 3",
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosSpecific = IOSNotificationDetails();
    var platformSpecific =
        NotificationDetails(android: andriodSpecific, iOS: iosSpecific);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        3, "Todey", "ended".tr, scheduledTime, platformSpecific,
        payload: "Test Payload",
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}

EndedNotificationHelper endedNotification = EndedNotificationHelper._();

_requestPermissionIos() {
  // im not runnin mac basically this project gonna be Andriod till i get a mac
}
