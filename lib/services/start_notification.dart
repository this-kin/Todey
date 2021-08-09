import 'dart:io' show File, Platform;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//TZDATETIME
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

///had to create different notification helper for each event
///this is is fired when event is started and early every morning (START NOTIFICATION)
class StartNotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  var initializationSetting;

  StartNotificationHelper._() {
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

  ////Start of the day
  Future<void> startOfDay() async {
    var now = DateTime.now();
    var scheduledTime =
        tz.TZDateTime.from(DateTime(now.year, 0, 0, 6, 0, 0, 0, 0), tz.local);
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 1",
      "CHANNEL_NAME 1",
      "CHANNEL_DESCRIPTION 1",
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

////Scheduled StartedDate
  Future<void> startScheduleNotification(DateTime date) async {
    var scheduledTime =
        tz.TZDateTime.from(date, tz.local).add(Duration(minutes: 1));
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 1",
      "CHANNEL_NAME 1",
      "CHANNEL_DESCRIPTION 1",
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosSpecific = IOSNotificationDetails();
    var platformSpecific =
        NotificationDetails(android: andriodSpecific, iOS: iosSpecific);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        2, "Todey", "morning".tr, scheduledTime, platformSpecific,
        payload: "Test Payload",
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}

StartNotificationHelper startNotification = StartNotificationHelper._();
_requestPermissionIos() {
  //im not runnin mac basically this project gonna be Andriod till i get a mac
}
