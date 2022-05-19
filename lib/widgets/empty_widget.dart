import 'package:todey/utils/exports.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.2,
        child: Container(
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ConstanceData.paperIcon),
            ),
          ),
        ),
      ),
    );
  }
}
