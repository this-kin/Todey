import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todey/utils/constant.dart';
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

  void collapse() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        collapse();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0.h),
        child: AnimatedContainer(
          height: _isExpanded ? 120.h : 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: widget.eventCategory == "Important"
                ? theme.primaryColor
                : kAccentColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          child: Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: avatarColor(widget.eventType),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(5.sp),
                child: Image.asset(
                  getAvatar(widget.eventType),
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 20.w),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _isExpanded ? 30.h : 18.h,
                      width: 120.w,
                      child: Text(
                        widget.eventTitle,
                        maxLines: _isExpanded ? 2 : 1,
                        style: theme.textTheme.overline.copyWith(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 20.h,
                      width: 170.w,
                      child: Text(
                        widget.eventNote,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headline5.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                widget.eventCreatedDate,
                style: theme.textTheme.button.copyWith(
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
