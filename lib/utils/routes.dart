import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todey/modules/onboard/onboard.dart';
import 'package:todey/modules/splash/splash.dart';

List<GetPage> routes = [
  GetPage(name: "/splash", page: () => Splash()),
  GetPage(name: '/onboarding', page: () => Onboard()),
  // GetPage(name: '/home', page: () => Home()),
  // GetPage(name: '/create', page: () => Create()),
  // GetPage(name: '/setting', page: () => Settings()),
];
