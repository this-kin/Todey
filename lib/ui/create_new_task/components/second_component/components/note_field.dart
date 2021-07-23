import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';

class NoteField extends StatelessWidget {
  EventController controller = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: kBackGroundColor2, borderRadius: BorderRadius.circular(15.sp)),
      child: Expanded(
        child: TextField(
          controller: controller.noteController.value,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'note'.tr,
              hintStyle: kListTileStyle),
        ),
      ),
    );
  }
}
