import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:todey/constants/color_constants.dart';
import 'package:todey/core/exports.dart';

class CustomDateTime extends StatelessWidget {
  final TimeOfDay date;
  final Function onPressed;

  const CustomDateTime({
    Key key,
    this.date,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.sp),
        child: Container(
          height: 40.h,
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                FontAwesome5.clock,
                size: 20.sp,
              ),
              Text(
                date.format(context),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: greyTextColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
