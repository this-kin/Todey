import 'package:cached_network_image/cached_network_image.dart';
import 'package:todey/utils/exports.dart';

class UserAvatar extends StatelessWidget {
  final String imgUrl;

  UserAvatar({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  _showBottomSheet(context, theme);
      },
      child: Container(
        height: 50.h,
        width: 50.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            height: 40.h,
            width: 40.w,
            fit: BoxFit.contain,
            errorWidget: _errorWidget,
          ),
        ),
      ),
    );
  }

  Widget _errorWidget(BuildContext context, String url, error) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ConstanceData.userIcon),
          ),
        ),
      ),
    );
  }

  kLogoutStyle() {
    return TextStyle(
      fontFamily: 'Raleway',
      color: Colors.white,
      fontSize: 14.sp,
    );
  }

  kDialogStyle() {
    return TextStyle(
      fontFamily: 'Raleway',
      fontSize: 14.sp,
    );
  }
}
