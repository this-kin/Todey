import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todey/constants/color_constants.dart';
import 'package:todey/constants/string_constant.dart';
import 'package:todey/core/routes.dart';
import 'package:todey/data/models/user_data.dart';
import 'package:todey/data/database.dart';
import 'package:todey/core/exports.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:todey/route_selector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path.getApplicationDocumentsDirectory();
  await Firebase.initializeApp();
  await DatabaseHelper().initialize();
  Hive.registerAdapter(UserDataAdapter());
  await Hive.initFlutter(directory.path);
  await Hive.openBox<UserData>(userDataString);
  await Hive.openBox<bool>(appTheme);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  authController.onReady();
  settingController.onReady();
  runApp(BetterFeedback(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: Size(360, 784),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: Locale("en", "US"),
          color: whiteColor,
          fallbackLocale: Locale('en', 'US'),
          theme: CustomTheme.buildLightTheme(),
          darkTheme: CustomTheme.buildDarkTheme(),
          home: RouteSelector(),
          title: "Todey",
          getPages: RouteGenerator.routes,
        );
      },
    );
  }
}
