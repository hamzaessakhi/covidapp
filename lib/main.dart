import 'dart:async';

import 'package:covid_19/colors.dart';
import 'package:covid_19/View/global.dart';
import 'package:covid_19/View/faq.dart';
import 'package:covid_19/View/preventions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'View/stats.dart';
import 'View/symptoms.dart';

void main() {

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C-19 App',
      theme:
          ThemeData(primaryColor: kBackgroundColor, fontFamily: 'Staatliches'),
      home: SplashScreen()));
}

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Stats(),
    Global(),
    Preventions(),
    Symptoms(),
    FAQ()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: kTextMediumColor,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(.1))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: GNav(
                gap: 3,
                activeColor: Colors.white,
                color: Colors.white,
                iconSize: 23,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: kPrimaryColor,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.globe,
                    text: 'Global',
                  ),
                  GButton(
                    icon: LineIcons.info_circle,
                    text: 'Info',
                  ),
                  GButton(
                    icon: LineIcons.bookmark,
                    text: 'Claim',
                  ),
                  GButton(
                    icon: LineIcons.wechat,
                    text: 'FAQ',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => StartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/splash.png'),
      ),
    );
  }
}