import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnText;
  final Function onPressed;

  const PrimaryButton({Key key, this.btnText, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height * 0.07,
        width: width - 90,
        decoration: BoxDecoration(
            color: theme.primaryColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            btnText,
            style: styleTxt(),
          ),
        ),
      ),
    );
  }

  TextStyle styleTxt() {
    return TextStyle(color: Colors.white, fontFamily: "MADType", fontSize: 18);
  }
}
