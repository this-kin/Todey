import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/widgets/item_avatar.dart';

class ItemWidget extends StatefulWidget {
  final bool isSelected;
  final String itemTitle;
  final String itemDesc;
  final String createdTime;
  final String itemType;
  final String itemIndex;

  const ItemWidget(
      {Key key,
      this.itemIndex,
      this.itemTitle,
      this.itemDesc,
      this.createdTime,
      this.itemType,
      this.isSelected})
      : super(key: key);
  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  EventController controller = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Dismissible(
      background: deleteContainer(),
      onDismissed: (direction) {
        //delete event
        // controller.deleteItem(widget.itemIndex, context);
      },
      key: Key(widget.itemIndex),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: height / 10,
        width: width,
        decoration: BoxDecoration(
            color:
                widget.itemType == "Important" ? kImportantColor : kPlanedColor,
            borderRadius: BorderRadius.circular(15)),
        child: customListile(),
      ),
    );
  }

  Widget customListile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ItemAvatar(
          image: "images/man.png",
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: Text(
                widget.itemTitle,
                overflow: TextOverflow.fade,
                textScaleFactor: 0.7,
                style: TextStyle(
                    color: kTextColor, fontFamily: "Raleway", fontSize: 18),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              widget.itemDesc,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: kSettingColor,
                  fontFamily: "MADType",
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Text("7:00 AM", style: kItemWidgetStyle)
      ],
    );
  }

  deleteContainer() {
    return Container(
      color: kDeletedColor,
      child: Icon(AntDesign.delete),
    );
  }
}
