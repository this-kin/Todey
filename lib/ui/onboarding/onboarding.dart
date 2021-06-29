import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';
import 'package:todey/models/welcome_model.dart';
import 'package:todey/ui/onboarding/components/onboard.dart';
import 'package:todey/utils/constant.dart';

int selectedIndex = 0;

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
    //

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height / 1.5,
            width: width,
            child: PageView.builder(
              itemCount: allWelcome.length,
              itemBuilder: (BuildContext context, int index) {
                return Onboard(
                  imageUrl: allWelcome[index].imageUrl,
                  introTxt: allWelcome[index].introTxt,
                );
              },
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getIndicator(index),
                );
              }),
            ),
          ),
        ],
      )),
      floatingActionButton: selectedIndex == 2
          ? FloatingActionButton(
              backgroundColor: theme.primaryColor,
              child: Icon(Icons.arrow_forward_rounded),
              onPressed: () {
                authService.signInWithGooogle(context);
                // Helper.replaceScreen(context, Main());
              },
            )
          : null,
    );
  }

  AnimatedContainer getIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 100,
      ),
      height: 10,
      width: selectedIndex == index ? 20 : 10,
      decoration: BoxDecoration(
          color: selectedIndex == index ? kAccentColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
