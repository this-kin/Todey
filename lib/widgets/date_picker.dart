import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/utils/theme.dart';

class PickDate extends StatefulWidget {
  final String value;
  final String btnText;
  final Function onPressed;

  const PickDate({Key key, this.value, this.btnText, this.onPressed})
      : super(key: key);
  @override
  _PickDateState createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        height: height * 0.06,
        width: width * 0.3,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.value}",
                style: TextStyle(
                    fontFamily: "Raleway", color: txtColor, fontSize: 15),
              ),
              Icon(MaterialIcons.arrow_drop_down, color: themeData.primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
