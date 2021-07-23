import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  EventController controller = Get.put(EventController());

  int selectedIndex = 0;
  //data
  List<String> allCategory = ["Important", "Planned"];

  //Build widgets

  buildChips({Color borderColor, Color bkgColor, String chipText, int index}) {
    return AnimatedContainer(
      height: 40.h,
      width: 80.w,
      decoration: BoxDecoration(
          color: bkgColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.sp)),
      duration: kDuration,
      child: Center(
        child: Text(
          chipText,
          style: kListTileStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      child: Wrap(
        spacing: 8.w,
        children: List.generate(allCategory.length, (int index) {
          return GestureDetector(
              onTap: () {
                print(allCategory[index]);
                setState(() {
                  selectedIndex = index;
                  controller.eventCategory.value = allCategory[selectedIndex];
                });
              },
              child: buildChips(
                  chipText: allCategory[index],
                  bkgColor:
                      selectedIndex == index ? kAccentColor : kBackgroundColor,
                  borderColor:
                      selectedIndex == index ? kAccentColor : kSettingColor));
        }),
      ),
    );
  }
}
