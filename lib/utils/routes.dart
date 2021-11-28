import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todey/modules/create/create.dart';
import 'package:todey/modules/dashboard/dashboard.dart';
import 'package:todey/modules/home/home.dart';
import 'package:todey/modules/onboard/onboard.dart';
import 'package:todey/modules/setting/setting.dart';
import 'package:todey/modules/splash/splash.dart';

List<GetPage> routes = [
  GetPage(name: "/splash", page: () => Splash()),
  GetPage(name: '/onboarding', page: () => Onboard()),
  GetPage(name: '/home', page: () => Home()),
  GetPage(name: '/dash', page: () => Dashboard()),
  GetPage(name: '/create', page: () => Create()),
  GetPage(name: '/setting', page: () => Setting()),
];
