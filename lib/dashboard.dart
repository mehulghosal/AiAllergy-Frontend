import 'package:flutter/material.dart';

import 'about.dart';
import 'home.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard> {
  PageController _pageController;
  int _page = 0;
  @override
  void initState() {
    super.initState();
    _pageController = new PageController(
      initialPage: 0,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }
  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEFEEE8),
      body: new PageView(
        children: [
          new Home(),
          new About(),
        ],
        onPageChanged: onPageChanged,
//        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
      ),

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          bottomAppBarColor: Colors.transparent,
          canvasColor: Color(0xFFEAEAEA),
        ),
        child: new BottomNavigationBar(
          onTap: navigationTapped,
          currentIndex: _page,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Colors.black45,
              ),
              title: new Text(
                'Home',
                style: new TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.info_outline,
                color: Colors.black45,
              ),
              title: new Text(
                'About',
                style: new TextStyle(
                  color: Colors.black45,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}