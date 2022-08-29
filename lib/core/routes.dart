import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todey/modules/create/components/voice.dart';
import 'package:todey/modules/create/create.dart';
import 'package:todey/modules/dashboard/dashboard.dart';
import 'package:todey/modules/home/home.dart';
import 'package:todey/modules/onboard/onboard.dart';
import 'package:todey/modules/setting/setting.dart';

class RouteGenerator {
  static const String onboarding = '/onboarding';
  static const String home = "/home";
  static const String dashboard = "/dashboard";
  static const String create = "/create";
  static const String setting = "/settings";
  static const String voice = "/voice";

  static final List<GetPage> routes = [
    GetPage(name: onboarding, page: () => Onboard()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: dashboard, page: () => Dashboard()),
    GetPage(name: create, page: () => Create()),
    GetPage(name: voice, page: () => Voice()),
    GetPage(name: setting, page: () => Setting()),
  ];
}
