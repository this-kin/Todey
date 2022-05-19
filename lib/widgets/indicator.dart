// ignore: must_be_immutable
import 'package:todey/utils/exports.dart';

// ignore: must_be_immutable
class Indicator extends StatefulWidget {
  int selectedIndex;

  Indicator({Key key, this.selectedIndex}) : super(key: key);

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 100.w,
      child: Wrap(
        spacing: 10.w,
        alignment: WrapAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            height: widget.selectedIndex == index ? 20.h : 18.h,
            width: widget.selectedIndex == index ? 20.h : 18.w - index,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.selectedIndex == index
                  ? Colors.amber
                  : Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
