import 'package:todey/core/exports.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.sp),
      ),
    );
  }
}
