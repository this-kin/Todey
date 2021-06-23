import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String image;

  const OnboardingImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: height / 3.2,
        width: width / 2.2,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}
