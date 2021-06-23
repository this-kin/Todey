import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todey/ui/onboarding/onboarding.dart';
import 'package:todey/utils/theme.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: themeData,
      home: Onboarding(),
      title: "Todey",
      debugShowCheckedModeBanner: false));
}
