import 'package:todey/core/routes.dart';
import 'package:todey/data/sqflite_db.dart';
import 'package:todey/utils/exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DatabaseHelper().initializeDB();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(AuthService());
  Get.put(SettingController());
  runApp(BetterFeedback(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
      statusBarBrightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          Get.isDarkMode ? Brightness.dark : Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize: Size(360, 784),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: Locale("en", "US"),
          color: Colors.white,
          fallbackLocale: Locale('en', 'US'),
          theme: CustomTheme.buildLightTheme(),
          darkTheme: CustomTheme.buildDarkTheme(),
          home: Onboard(),
          title: "Todey",
          getPages: RouteGenerator.routes,
        );
      },
    );
  }
}
