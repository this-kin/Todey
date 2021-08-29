import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/controllers/settings_controller.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/services/notification_service.dart';
import 'package:todey/services/start_notification.dart';
import 'package:todey/ui/home/home_page.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/global.dart' as global;
import 'package:todey/utils/routes.dart';
import 'package:todey/utils/theme.dart';
import 'package:todey/utils/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SQFliteDB().initializeDB();
  await Firebase.initializeApp();
  startNotification.startOfDay();
  endedNotification.endOfDay();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Dependency injection
  AuthService authService = Get.put(AuthService());
  SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    print(authService.userImageUrl);
    print(settingController.defaultLanguage.value);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          global.isLight ? Brightness.dark : Brightness.light,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: CoustomTheme.getThemeData().cardColor,
      systemNavigationBarDividerColor:
          CoustomTheme.getThemeData().disabledColor,
      systemNavigationBarIconBrightness:
          global.isLight ? Brightness.dark : Brightness.light,
    ));

    return Phoenix(
      child: ScreenUtilInit(
        designSize: Size(360, 784),
        builder: () {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              translations: Translation(),
              locale: Locale(settingController.defaultLanguage.value),
              fallbackLocale: Locale('en', 'US'),
              theme: themeData,
              home: authService.isSignedIn.value == null
                  ? Onboarding()
                  : HomePage(),
              title: "Todey",
              getPages: routes,
            ),
          );
        },
      ),
    );
  }
}
