import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:todey/modules/create/create.dart';
import 'package:todey/modules/dashboard/dashboard.dart';
import 'package:todey/modules/setting/setting.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//list of pages
  final List<Widget> _pages = [Dashboard(), Create(), Setting()];

//controller
  final PageController _pageController = PageController();

  //tracks current page
  int _currentIndex = 0;

//
  void _onPageChanged(index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

//
  void _itemTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: PageView(
        children: _pages,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _itemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: FloatingActionButton(
          onPressed: () {
            _pageController.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut);
          },
          backgroundColor: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.sp),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onPageChanged,
          elevation: 0,
          enableFeedback: true,
          backgroundColor: theme.backgroundColor,
          selectedItemColor: theme.primaryColor,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_sharp,
                    size: _currentIndex == 2 ? 1 : 1),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ]),
    );
  }
}
