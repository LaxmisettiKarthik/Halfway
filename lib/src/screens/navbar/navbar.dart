import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Dashboard/appDashboard.dart';
import '../Directions/spare.dart';
import '../login/registration.dart';
import '../login/updateProfile.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 1;
  final List<Widget> _children = [ 
    Miscellaneous(),   
    AppDashboard(),
    DragBar(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Dashboard")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Profile"),
              onTap:(){
                 Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => RegistrationPage()),
                    );
              }
            ),
             ListTile(
              title: const Text("Update Profile"),
              onTap:(){
                 Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ProfileUpdate()),
                    );
              }
            ),
          ],
        ),
      ),
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
