import 'package:flutter/material.dart';
import 'package:todey/models/dummy_datas.dart';
import 'package:todey/widgets/item_widget.dart';

class MyHomeBody extends StatefulWidget {
  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monday 19",
            style: styleText(theme),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: ListView.builder(
                itemCount: allItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ItemWidget(
                      itemIndex: allItem[index].toString(),
                      itemDesc: allItem[index].itemDesc,
                      itemTitle: allItem[index].itemTitle,
                      itemType: allItem[index].itemType,
                      isSelected: allItem[index].isSelected,
                      createdTime: allItem[index].createdTime,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle styleText(ThemeData theme) {
    return TextStyle(
        color: theme.primaryColor, fontFamily: "Raleway", fontSize: 25);
  }
}
