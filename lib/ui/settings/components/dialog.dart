import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/settings_controller.dart';
import 'package:todey/models/language_models.dart';
import 'package:todey/services/sp_service.dart';
import 'package:todey/utils/constant.dart';

class KBottom extends StatelessWidget {
  SettingController settingController = Get.put(SettingController());
  //build widgets
  buildTile({String title, Function onPressed, Widget trailing}) {
    return Container(
        height: 60.h,
        child: ListTile(
          onTap: onPressed,
          title: Text(title, style: kSettingStyle()),
          trailing: trailing,
        ));
  }

  SP spService = SP();
  @override
  Widget build(BuildContext context) {
    //theme
    var theme = Theme.of(context);
    return Container(
      height: 260.h,
      color: theme.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Lannguage",
              style: kSelectStyle(),
            ),
            SizedBox(height: 20.h),
            Flexible(
              child: ListView.builder(
                itemCount: allLang.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildTile(
                      title: allLang[index].title,
                      onPressed: () {
                        ///change the language
                        settingController.changeLanguage(
                            allLang[index].param1, allLang[index].param2);

                        ///save state of current language
                        spService.saveLanguage(
                            locale:
                                "${allLang[index].param1}'_'${allLang[index].param2}");
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  kSelectStyle() {
    return TextStyle(
      fontSize: 18.sp,
      color: Colors.white,
      fontFamily: "Raleway",
      fontWeight: FontWeight.w500,
    );
  }

  kSettingStyle() {
    return TextStyle(
      fontSize: 15.sp,
      fontFamily: "MADType",
      fontWeight: FontWeight.w400,
      color: kSettingColor,
    );
  }
}
