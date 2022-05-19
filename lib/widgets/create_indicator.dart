import 'package:todey/utils/exports.dart';

// ignore: must_be_immutable
class CreateIndicator extends StatefulWidget {
  int currentIndex;

  CreateIndicator({Key key, this.currentIndex}) : super(key: key);

  @override
  _CreateIndicatorState createState() => _CreateIndicatorState();
}

class _CreateIndicatorState extends State<CreateIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 350.w,
      alignment: Alignment.center,
      child: Wrap(
        spacing: 10.w,
        children: List.generate(
          2,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 7.h,
              width: 155.w,
              decoration: BoxDecoration(
                color: index == widget.currentIndex
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
