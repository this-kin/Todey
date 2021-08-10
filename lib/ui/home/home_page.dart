import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/ui/create_new_task/create_task.dart';
import 'package:todey/ui/home/home.dart';
import 'package:todey/ui/settings/setings.dart';
import 'package:todey/utils/helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> pages = [Home(), Create(), Settings()];
  void _onChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    //instance var to get responsiveness and theme
    var theme = Theme.of(context);
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: pages,
          controller: _pageController,
          onPageChanged: _onChanged,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          child: Icon(Icons.add),
          onPressed: () {
            Helper.nextScreen(context, Create());
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: theme.backgroundColor,
          selectedItemColor: theme.primaryColor,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_sharp,
                    size: selectedIndex == 2 ? 1 : 1),
                label: ""),
            BottomNavigationBarItem(icon: Icon(AntDesign.setting), label: "")
          ],
        ));
  }
}
