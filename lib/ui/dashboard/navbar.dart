import 'package:RefApp/ui/dashboard/notifications.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'appDashboard.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 0;
  final List<Widget> _children = [
    AppDashboard(),
    Notifications(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          currentIndex: _page,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey,
            ),
           
            DotNavigationBarItem(
              icon: Icon(Icons.notifications),
              selectedColor: Colors.black,
              unselectedColor: Colors.grey,
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
