import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:halfway/screens/appDashboard.dart';
//import 'package:mptest/dash2.dart';
import 'package:halfway/screens/Registration.dart';
import 'package:halfway/screens/mapDash.dart';
import 'package:halfway/screens/miscScreens/misc.dart';
import 'package:halfway/screens/updateProfile.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 1;
  final List<Widget> _children = [
    const Miscellaneous(),
    AppDashboard(),
    const DragBar(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Dashboard")),
        
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Colors.black,
          items: const <Widget>[
            Icon(
              Icons.map,
              size: 30,
              color: Colors.purple,
            ),
            Icon(
              Icons.home,
              size: 30,
              color: Colors.purple,
            ),
            Icon(
              Icons.dashboard,
              size: 30,
              color: Colors.purple,
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
