import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:halfway/screens/utils.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(title: Text('map')),
        body: SingleChildScrollView(child: 
        Container(
          color:Colors.grey,
      alignment: Alignment.bottomCenter,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Container(
              height: 625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60 * fem),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff221c1c),
                    ),
                    margin: EdgeInsets.all(20),
                    height: 220,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 74 * fem,
                          top: 69 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 120 * fem,
                              // height: 43 * fem,
                              child: Column(
                                children: const [
                                  TextField(
                                      decoration: InputDecoration(
                                          hintText: "Destination",
                                          hintStyle:
                                              TextStyle(color: Colors.white))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // sC4 (6:26)
                          left: 74 * fem,
                          top: 52 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 235 * fem,
                              height: 29 * fem,
                              child: Text(
                                '-------------------------',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Actor',
                                  fontSize: 24 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2025 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // ellipse45xDW (2:14)
                          left: 320 * fem,
                          top: 35.9892272949 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 58.43 * fem,
                              height: 58.44 * fem,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        40), // Button's border radius
                                  ),
                                  backgroundColor: Colors
                                      .grey, // Background color of the button
                                  foregroundColor: Colors.white, // Text color
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  // Button padding
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // yourlocationvZe (2:5)
                          left: 74 * fem,
                          top: 23 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 141 * fem,
                              height: 29 * fem,
                              child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Your Location",
                                      hintStyle:
                                          TextStyle(color: Colors.white))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child:
                  Positioned(
                      // barWy6 (19:112)
                      left: 35 * fem,
                      top: 450 * fem,
                      child: Container(
                        width: 350 * fem,
                        height: 60 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120 * fem),
                          color: Color.fromARGB(0, 161, 165, 188),
                        ),
                        child: BottomNavigationBar(
                          onTap: (index) {},
                          items: [
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                'assets/images/page-1/images/images/truck-1.png',
                                fit: BoxFit.cover,
                                width: 50 * fem,
                                height: 26 * fem,
                              ),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                'assets/images/page-1/images/images/motorcycle-1.png',
                                fit: BoxFit.cover,
                                width: 40 * fem,
                                height: 26 * fem,
                              ),
                              label: 'Search',
                            ),
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                'assets/images/page-1/images/images/walk-1.png',
                                fit: BoxFit.cover,
                                width: 25 * fem,
                                height: 26 * fem,
                              ),
                              label: 'Profile',
                            ),
                            BottomNavigationBarItem(
                              icon: Image.asset(
                                'assets/images/page-1/images/images/sport-car-1.png',
                                fit: BoxFit.cover,
                                width: 50 * fem,
                                height: 26 * fem,
                              ),
                              label: 'Profile',
                            ),
                          ],
                        ),
                      )),)
                ],
              ),
            ),
          ],
        ),
      ),
    )),);
  }
}
