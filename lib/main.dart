import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/controllers/settings_controller.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/ui/home/home_page.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/translation.dart';

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
  SettingController settingController = Get.put(SettingController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 784),
        builder: () {
          return Obx(
            () => GetMaterialApp(
                translations: Translation(),
                locale: settingController.defaultLanguage.value,
                fallbackLocale: Locale('en', 'US'),
                theme: themeData,
                //will be changed future builder is very Slow
                home: authService.userImageUrl.value == null ? Onboarding() : HomePage(),
                title: "Todey",
                debugShowCheckedModeBanner: false),
          );
        });
  }
}
