import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/controllers/onboard_controller.dart';
import 'package:todey/models/welcome_model.dart';
import 'package:todey/ui/onboarding/components/onboard.dart';
import 'package:todey/utils/constant.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService());
    //mediaquery for responsiveness
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //theme for selecting color
    var theme = Theme.of(context);
    //Dependency Injection
    OnboardController onboardController = Get.put(OnboardController());

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height / 1.5,
              width: width,
              child: Obx(
                () => PageView.builder(
                  itemCount: allWelcome.length,
                  controller: onboardController.pageController.value,
                  itemBuilder: (BuildContext context, int index) {
                    return Onboard(
                      imageUrl: allWelcome[index].imageUrl,
                      introTxt: allWelcome[index].introTxt,
                    );
                  },
                  onPageChanged: (index) {
                    onboardController.pageChanged(index);
                  },
                ),
              ),
            ),
          ],
        )),
        floatingActionButton: Obx(
          () => FloatingActionButton.extended(
            backgroundColor: theme.accentColor,
            label: Text(onboardController.selectedIndex.value == 2
                ? "Continue"
                : "Next"),
            onPressed: () {
              //is not last page scroll else login(authenticate)
              onboardController.selectedIndex.value == 2
                  ? authService.signInWithGooogle(context)
                  : onboardController.navigatePage();
            },
          ),
        ));
  }
}
