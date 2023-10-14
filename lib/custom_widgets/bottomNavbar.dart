import 'package:brototype_app/home.dart';
import 'package:brototype_app/screens/profile.dart';
import 'package:brototype_app/screens/search_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int _currentIndex = 0;
  List<Widget> bottomList = [
    const HomeScreen(),
    const search_Bar(),
    const ProfilePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomList[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.video_collection),
          Icon(Icons.account_box),
        ],
      ),
    );
  }
}
