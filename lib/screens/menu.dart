import 'package:flutter/material.dart';
import 'package:medicalapp/constants/constants.dart';
import 'package:medicalapp/screens/mainscreen.dart';
import 'package:medicalapp/screens/map.dart';
import 'package:medicalapp/screens/settings.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    HeatmapPage(),
    Settings_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          backgroundColor: const Color.fromARGB(255, 213, 213, 213),
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                pill,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                pill,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Medical Bills",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                map,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                map,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Custom Map",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                settings,
                height: kBottomNavigationBarItemSize,
              ),
              icon: Image.asset(
                settings,
                height: kBottomNavigationBarItemSize,
              ),
              label: "Settings",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
