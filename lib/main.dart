import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/core/db_helper.dart';
import 'package:todey/services/sp_service.dart';
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
  @override
  void initState() {
    super.initState();
    var currentLang = SP().fetchLang();
    print(currentLang);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 784),
        builder: () {
          return GetMaterialApp(
              translations: Translation(),
              locale: Locale('en', 'US'),
              fallbackLocale: Locale('en', 'US'),
              theme: themeData,
              home: FutureBuilder(
                future: authService.getLoginState(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return HomePage();
                  }
                  return Onboarding();
                },
              ),
              title: "Todey",
              debugShowCheckedModeBanner: false);
        });
  }
}
