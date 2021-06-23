import 'package:flutter/material.dart';
import 'package:todey/ui/onboarding/components/content_image.dart';

class Onboard extends StatelessWidget {
  final String imageUrl;
  final String introTxt;

  const Onboard({Key key, this.imageUrl, this.introTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnboardingImage(
          image: imageUrl,
        ),
        Text(introTxt,
            style: TextStyle(
                color: Colors.white, fontFamily: "Raleway", fontSize: 22))
      ],
    );
  }
}
