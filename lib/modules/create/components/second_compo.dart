import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/constants/event_type_model.dart';
import 'package:todey/widgets/action_button.dart';

class SecondComponent extends StatefulWidget {
  const SecondComponent({Key key}) : super(key: key);

  @override
  _SecondComponentState createState() => _SecondComponentState();
}

class _SecondComponentState extends State<SecondComponent> {
  //
  final EventController _con = Get.put(EventController());

  //
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 50.h,
              width: double.infinity,
              alignment: Alignment.center,
              child: Wrap(
                spacing: 10.w,
                children: List.generate(
                  allEventTypes.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        _con.eventType.value =
                            allEventTypes[_selectedIndex].name;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedIndex == index
                              ? theme.primaryColor
                              : Colors.transparent,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            allEventTypes[index].imageurl,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 55.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _con.titleController.value,
                style: theme.textTheme.headline4,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  hintText: "Task Name",
                  hintStyle: theme.textTheme.headline4,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 230.h,
              width: 350.w,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _con.noteController.value,
                style: theme.textTheme.headline4,
                maxLines: 50,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  //  hintText: "Task Name",
                  hintStyle: theme.textTheme.headline4,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Container(
                height: 60.h,
                width: 200.w,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(
                      iconData: FontAwesome.camera,
                      onPressed: () async {
                        //activate camera
                        print(_con.eventAttachment);
                      },
                    ),
                    ActionButton(
                      iconData: Icons.mic_rounded,
                      onPressed: () {
                        //activate recorder
                        print("clicked");
                      },
                    ),
                    ActionButton(
                      iconData: Icons.text_fields,
                      onPressed: () {
                        //activate blog type
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
