import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/auth_controller.dart';

class UserAvatar extends StatelessWidget {
  final String imgUrl;

  const UserAvatar({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authServiceController = Get.put(AuthService());
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        authServiceController.signOut();
      },
      child: Container(
        height: height * 0.06,
        width: height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(imgUrl))),
      ),
    );
  }
}
