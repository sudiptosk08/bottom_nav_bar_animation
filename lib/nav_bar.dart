import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantake/custom_navigation_bar/bar_item.dart';
import 'package:plantake/custom_navigation_bar/build_nav_bar.dart';
import 'package:plantake/floatingActionButton.dart';

import 'meta_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] only for android black navigation bar. 3 button navigation control (legacy)

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Color.fromARGB(255, 157, 154, 222),
              child: Icon(
                Icons.bookmark_rounded,
                size: 56,
                color: Colors.amber[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Color.fromARGB(255, 157, 154, 222),
              child: Icon(
                Icons.favorite_rounded,
                size: 56,
                color: Colors.red[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Color.fromARGB(255, 157, 154, 222),
              child: Icon(
                Icons.email_rounded,
                size: 56,
                color: Colors.green[400],
              ),
            ),
          
            MetaPage()
          ],
        ),
        floatingActionButton: FloatingActionBottom(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              filledIcon: Image.asset(
                "assets/icons/sun.png",
                color: Colors.black,
                width: 25,
                height: 25,
              ),
              outlinedIcon: Image.asset(
                "assets/icons/sun.png",
                color: Colors.grey,
                width: 25,
                height: 25,
              ),
              topIcon: false,
            ),
            BarItem(
              filledIcon: Image.asset(
                "assets/icons/quote.png",
                color: Colors.black,
                width: 25,
                height: 25,
              ),
              outlinedIcon: Image.asset(
                "assets/icons/quote.png",
                color: Colors.grey,
                width: 25,
                height: 25,
              ),
              topIcon: true,
            ),
            BarItem(
              filledIcon: Image.asset(
                "assets/icons/sound-wave.png",
                color: Colors.black,
                width: 25,
                height: 25,
              ),
              outlinedIcon: Image.asset(
                "assets/icons/sound-wave.png",
                color: Colors.grey,
                width: 25,
                height: 25,
              ),
              topIcon: false,
            ),
            BarItem(
              filledIcon: Image.asset(
                "assets/icons/file.png",
                color: Colors.black,
                width: 25,
                height: 25,
              ),
              outlinedIcon: Image.asset(
                "assets/icons/file.png",
                color: Colors.grey,
                width: 25,
                height: 25,
              ),
              topIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
