import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/helper.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    EventController controller = Get.put(EventController());

//build widgets
    Widget customIcon({
      IconData icon,
      Function onPressed,
      Color gradient1,
      Color gradient2,
    }) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [gradient1, gradient2])),
          child: Center(
            child: Icon(
              icon,
              size: 25.sp,
            ),
          ),
        ),
      );
    }

    return Container(
      height: 70.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customIcon(
              onPressed: () {
                //close page navigate back,
                controller.selectedIndex.value == 0
                    ? Helper.popScreen(context)
                    : controller.pageController.value.jumpToPage(0);
              },
              gradient1: kSettingColor.withOpacity(0.2),
              gradient2: kSettingColor.withOpacity(0.2),
              icon: Icons.close),
          GetX<EventController>(builder: (controller) {
            return customIcon(
                onPressed: () {
                  //open next form
                  controller.selectedIndex.value == 0
                      ? controller.pageController.value.jumpToPage(1)
                      : controller.addEvent(context);
                },
                gradient1: kImportantColor.withOpacity(0.7),
                gradient2: kImportantColor,
                icon: controller.selectedIndex.value == 0
                    ? Icons.arrow_forward_sharp
                    : Icons.done);
          })
        ],
      ),
    );
  }
}
