import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/helper.dart';

class TextWidget extends StatefulWidget {
  final String eventTitle;
  final String eventNote;
  final String eventCategory;
  final String eventCreatedDate;
  final int eventIndex;
  final int eventId;
  final String eventType;
  final String eventAttachment;

  const TextWidget({
    Key key,
    this.eventTitle,
    this.eventNote,
    this.eventCategory,
    this.eventCreatedDate,
    this.eventIndex,
    this.eventId,
    this.eventType,
    this.eventAttachment,
  }) : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: avatarColor(widget.eventCategory),
                backgroundImage: AssetImage(getAvatar(widget.eventType)),
                radius: 22.sp,
              ),
              //event Title
              Container(
                width: 100.w,
                height: 20.h,
                child: Text(
                  widget.eventTitle,
                  overflow: TextOverflow.fade,
                  textScaleFactor: 0.7,
                  style: TextStyle(
                      color: kTextColor, fontFamily: "Raleway", fontSize: 18),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              //Event Notes
              Container(
                width: 120.w,
                height: 20.h,
                child: Text(
                  widget.eventNote,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      //  color: kSettingColor,
                      fontFamily: "MADType",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          Text(
            widget.eventCreatedDate,
            // style: kItemWidgetStyle,
          )
        ],
      ),
    );
  }
}

/* 
Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedContainer(
          height: _isExpanded ? 120.h : 90.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: getColor(widget.eventCategory),
          ),
          duration: ConstanceData.kDuration,
          curve: Curves.bounceInOut,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              backgroundColor: avatarColor(widget.eventCategory),
              backgroundImage: AssetImage(getAvatar(widget.eventType)),
              radius: 22.sp,
            ),
            SizedBox(width: 20.w),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140.w,
                    height: 20.h,
                    child: Text(
                      widget.eventTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: _isExpanded ? 3 : 1,
                      textScaleFactor: 0.7,
                      style: theme.textTheme.overline,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 140.w,
                    height: _isExpanded ? 40.h : 12.h,
                    child: Text(
                      widget.eventNote,
                      overflow: _isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      maxLines: _isExpanded ? 3 : 2,
                      style: theme.textTheme.headline5.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Text(
              widget.eventCreatedDate,
            )
          ]),
        ),
      ),
    );
    */
