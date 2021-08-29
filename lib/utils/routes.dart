import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todey/ui/create_new_task/create_task.dart';
import 'package:todey/ui/home/home.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/ui/settings/setings.dart';

List<GetPage> routes = [
  GetPage(name: '/onboarding', page: () => Onboarding()),
  GetPage(name: '/home', page: () => Home()),
  GetPage(name: '/create', page: () => Create()),
  GetPage(name: '/setting', page: () => Settings()),
];
