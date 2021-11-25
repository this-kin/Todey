import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/models/welcome_model.dart';
import 'package:todey/services/auth_service.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  //
  final AuthService _authService = Get.put(AuthService());
  //
  final PageController _pageController = PageController();

  //tracks current page
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300.h,
              width: 300.w,
              child: PageView.builder(
                itemCount: allOnboard.length,
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                onPageChanged: (val) {
                  setState(() {
                    _selectedIndex = val;
                  });
                },
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(allOnboard[index].imageUrl),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Text(
                        allOnboard[index].introTxt,
                        style: theme.textTheme.overline,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          _selectedIndex < 2
              ? _pageController.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.bounceInOut)
              : _authService.googleSigning();
        },
        label: Text(
          _selectedIndex < 2 ? "Next" : "Continue",
          style: theme.textTheme.button,
        ),
      ),
    );
  }
}
