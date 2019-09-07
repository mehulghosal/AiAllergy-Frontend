import 'package:flutter/material.dart';

import 'about.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  PageController _pageController;
  int _page = 1;
  @override
  void initState() {
    super.initState();
    _pageController = new PageController(
      initialPage: 1,
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
            new Chat(),
            new Home(),
            new Profile(document: null),
          ],
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
        ),

        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            bottomAppBarColor: Colors.transparent,
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: new BottomNavigationBar(
            onTap: navigationTapped,
            currentIndex: _page,
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.chat_bubble,
                  color: Theme.of(context).accentColor,
                ),
                title: new Text(
                  'Chat',
                  style: new TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
                title: new Text(
                  'Home',
                  style: new TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.person,
                  color: Theme.of(context).accentColor,
                ),
                title: new Text(
                  'Profile',
                  style: new TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                )
              ),
            ],
          ),
        ),

      body: Stack (
        children: <Widget>[
          Container (
            child: Image.asset(
              'images/logo.png',
              height: 300,

//              scale: 1.2,
            ),
            alignment: new Alignment(0,-1)
          ),
          Container (
              child: ButtonTheme (
                height: 125.0,
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFFACECD5),
                  child: const Text('Evaluate', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
              alignment: new Alignment(0,-0.3)
          ),
          Container (
              child: ButtonTheme (
                height: 125.0,
                minWidth: 300.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF5BB7E5),
                  child: const Text('Allergens', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
              alignment: new Alignment(0,0.1)
          ),
          Container (
            child: ButtonTheme (
              height: 125.0,
              minWidth: 300.0,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xFFE57472),
                child: const Text('Emergency', style: TextStyle(fontSize: 40, fontFamily: 'Open Sans', fontWeight: FontWeight.w400,)),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
              ),
            ),
            alignment: new Alignment(0,0.5)
          ),
          Container (
            alignment: new Alignment(-0.2,1),
            child: FlatButton (
              child: Text("Home",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    fontSize: 25.0
                ),
              )
            ),
          ),
          Container (
            alignment: new Alignment(0.2,1),
            child: FlatButton (
              onPressed: () {
//                Navigator.of(context)pushReplacementNamed('/about');
                Navigator.of(context).push(_homeAbout());
              },
              child: Text("About",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Lato',
                    fontSize: 25.0
                ),
              )
            ),
          )
        ],
      ),
    );
  }
  Route _homeAbout() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => About(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}