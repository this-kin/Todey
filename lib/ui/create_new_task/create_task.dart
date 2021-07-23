import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/ui/create_new_task/components/first_components/components/custom_appbar.dart';
import 'package:todey/ui/create_new_task/components/first_components/first_slide.dart';
import 'package:todey/ui/create_new_task/components/second_component/second_slide.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    EventController controller = Get.put(EventController());
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor.withOpacity(0.5),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Theme.of(context).backgroundColor),
          height: 670.h,
          width: double.infinity,
          child: SingleChildScrollView(
              child: Container(
            height: 670.h,
            child: Column(
              children: [
                CustomAppBar(),
                Flexible(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      controller.selectedIndex.value = index;
                      setState(() {});
                    },
                    // physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController.value,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0 ? FirstSlide() : SecondSlide();
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
