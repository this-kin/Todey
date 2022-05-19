import 'package:todey/utils/exports.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const ActionButton({
    Key key,
    this.onPressed,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          iconData,
          color: kAccentColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
