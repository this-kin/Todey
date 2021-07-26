import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';

class TitleField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EventController controller = Get.put(EventController());
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: kBackGroundColor2, borderRadius: BorderRadius.circular(15.sp)),
      child: Center(
        child: TextField(
          controller: controller.titleController.value,
          maxLines: 200,
          style: kListTileStyle,
          autocorrect: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "task_name".tr,
              hintStyle: kListTileStyle),
        ),
      ),
    );
  }
}
