import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/ui/create_new_task/components/second_component/components/event_type.dart';
import 'package:todey/ui/create_new_task/components/second_component/components/note_field.dart';
import 'package:todey/ui/create_new_task/components/second_component/components/title_field.dart';

// ignore: must_be_immutable
class SecondSlide extends StatelessWidget {
  EventController controller = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          EventType(),
          SizedBox(height: 40.h),
          TitleField(),
          SizedBox(height: 20.h),
          NoteField()
        ],
      ),
    );
  }
}
