import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';

class SettingTile extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  final IconData icon;

  const SettingTile({Key key, this.btnText, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Mediaquery to get responsiveness
    var height = MediaQuery.of(context).size.height;

    //theme
    var theme = Theme.of(context);
    //date time button will be from the boat ui
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: height * 0.07,
          child: Center(
            child: ListTile(
              leading: Icon(
                icon,
                color: Colors.white,
              ),
              title: Text(
                btnText,
                style: kListTileStyle,
              ),
            ),
          )),
    );
  }
}
