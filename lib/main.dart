import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/ui/home/home.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SQFliteDB().initializeDB();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ScreenUtilInit(
      designSize: Size(360, 784),
      builder: () {
        AuthService authServiceController = Get.put(AuthService());
        return MaterialApp(
            theme: themeData,
            home:
                authServiceController.isSignedIn.value ? Home() : Onboarding(),
            title: "Todey",
            debugShowCheckedModeBanner: false);
      }));
}
