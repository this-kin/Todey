import 'package:todey/data/models/welcome_model.dart';
import 'package:todey/utils/exports.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _pageController = PageController();

  //tracks current page
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            Center(
              child: Container(
                height: 300.h,
                width: 300.w,
                child: PageView.builder(
                  itemCount: allOnboard.length,
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
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
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Indicator(
              selectedIndex: _selectedIndex,
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
              : authController.login(context);
        },
        label: Text(
          _selectedIndex < 2 ? "Next" : "Continue",
          style: theme.textTheme.button,
        ),
      ),
    );
  }
}
