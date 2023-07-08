import 'package:RefApp/profile.dart';
import 'package:RefApp/sample.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import 'home.dart';
import 'mapDash.dart';
import 'appDashboard.dart';
import 'notifications.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 0;
  final List<Widget> _children = [
    AppDashboard(),
    RegistrationPage(),
    Notifications(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        bottomNavigationBar:DotNavigationBar(
          currentIndex: _page,          
          items: [
          DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.black,
            ),
          DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Colors.black,
            ),
           DotNavigationBarItem(
              icon: Icon(Icons.notifications),
              selectedColor: Colors.black,
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
       
        body: _children[_page]);
  }
}
