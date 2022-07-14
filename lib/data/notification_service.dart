import 'dart:io' show Platform;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

class StartNotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  var initializationSetting;

  StartNotificationHelper._() {
    initializer();
  }

  initializer() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestPermissionIos();
    }
    initializeSettings();
  }

  initializeSettings() {
    var initializeAndrioidSetting = AndroidInitializationSettings("todey");
    var initializeIosSetting = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    initializationSetting = InitializationSettings(
        android: initializeAndrioidSetting, iOS: initializeIosSetting);
  }

  // on notification click
  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

  // start of the day
  Future<void> startOfDay() async {
    var scheduledTime = Time(6, 0, 0);
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 0",
      "CHANNEL_NAME 0",
      channelDescription: "CHANNEL_DESCRIPTION 0",
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosSpecific = IOSNotificationDetails();
    var platformSpecific =
        NotificationDetails(android: andriodSpecific, iOS: iosSpecific);
    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      "Todey",
      "started".tr,
      scheduledTime,
      platformSpecific,
      payload: "Test Payload",
    );
  }

  // scheduled started Date
  Future<void> startNotification(DateTime date) async {
    var scheduledTime =
        tz.TZDateTime.from(date, tz.local).add(Duration(minutes: 1));
    var andriodSpecific = AndroidNotificationDetails(
      "CHANNEL_ID 1",
      "CHANNEL_NAME 1",
      channelDescription: "CHANNEL_DESCRIPTION 1",
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosSpecific = IOSNotificationDetails();
    var platformSpecific =
        NotificationDetails(android: andriodSpecific, iOS: iosSpecific);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        1, "Todey", "started".tr, scheduledTime, platformSpecific,
        payload: "Test Payload",
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  } // scheduled started Date

  Future<void> endedNotification(DateTime date) async {
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
        1, "Todey", "ended".tr, scheduledTime, platformSpecific,
        payload: "Test Payload",
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  _requestPermissionIos() {
    // im not runnin mac basically this project gonna be Andriod till i get a mac
  }
}

StartNotificationHelper startNotification = StartNotificationHelper._();
