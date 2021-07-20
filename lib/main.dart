import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/ui/home/home_page.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SQFliteDB().initializeDB();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 784),
        builder: () {
          return Obx(() => MaterialApp(
              theme: themeData,
              home: authService.userImageUrl.value != null
                  ? Main()
                  : Onboarding(),
              title: "Todey",
              debugShowCheckedModeBanner: false));
        });
  }
}
