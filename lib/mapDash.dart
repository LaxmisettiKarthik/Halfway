import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'landing_screen.dart';
import 'utils.dart';

class DragBar extends StatefulWidget {
  const DragBar({super.key});

  @override
  State<DragBar> createState() => _DragBarState();
}

class _DragBarState extends State<DragBar> {
  final List<IconData> icons = const [
    Icons.message,
    Icons.call,
    Icons.mail,
    Icons.notifications,
    Icons.settings,
  ];
  final List<Widget> _inputFields = [];
  int _page = 0;
  final List<Widget> _children = [
    const Truck(),
    const Bike(),
    const Walk(),
    const Car(),
  ];

  final List<Widget> _child = [
    const TruckExapand(),
    const BikeExpand(),
    const WalkExpand(),
    const CarExpand(),
  ];
  final List<Widget> _maps = [
    const Text(
      "Map 1",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    const Text(
      "Map 2",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    const Text(
      "Map 3",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    const Text(
      "Map 4",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    )
  ];
  @override
  void initState() {
    super.initState();

    // Add an initial input field when the widget is created
    _addInputField();
  }

  void _addInputField() {
    setState(() {
      // Add a new TextFormField to the list of input fields
      _inputFields.add(const TextField(
          decoration: InputDecoration(
              hintText: "Add stop",
              hintStyle: TextStyle(color: Colors.white))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: DraggableBottomSheet(
            minExtent: 30,
            useSafeArea: false,
            curve: Curves.easeIn,
            //barrierDismissible: true,
            previewWidget: _previewWidget(),
            expandedWidget: _expandedWidget(),
            backgroundWidget: _backgroundWidget(),
            maxExtent: MediaQuery.of(context).size.height * 0.8,
            onDragging: (pos) {},
          ),
        );
      }),
    ));
  }

  Widget _backgroundWidget() {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Container(
                // iphone14promax1Rw6 (1:100)
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff3e4a57),
                ),
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroup26mvZ9S (3WMoGfmFqvj54zLji726MV)
                        padding: EdgeInsets.fromLTRB(
                            7 * fem, 10 * fem, 7 * fem, 36 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // image4GpY (8:2)
                              width: 386 * fem,
                              height: 441 * fem,
                              color: Colors.black,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30 * fem),
                                  child: Center(
                                    child: _maps[_page],
                                  )),
                            ),
                            SizedBox(
                              height: 11 * fem,
                            ),
                            Container(
                              // frame1Zoe (2:6)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 15 * fem, 0 * fem),
                              width: 401 * fem,
                              height: 200 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60 * fem),
                                color: const Color(0xff221c1c),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    // destinationmui (2:12)
                                    left: 74 * fem,
                                    top: 69 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 120 * fem,
                                        // height: 43 * fem,
                                        child: Column(
                                          children: [
                                            const TextField(
                                                decoration: InputDecoration(
                                                    hintText: "Destination",
                                                    hintStyle: TextStyle(
                                                        color: Colors.white))),
                                            ..._inputFields,
                                          ],
                                        ),

                                        //
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
                                    left: 323 * fem,
                                    top: 35.9892272949 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 58.43 * fem,
                                        height: 58.44 * fem,
                                        child: ElevatedButton(
                                          onPressed: _addInputField,
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
                                                hintStyle: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 11 * fem,
                            ),
                            Container(
                              // autogroupvilwD2x (3WMnuvrpBfY6LBxzqcviLw)
                              margin: EdgeInsets.fromLTRB(
                                  15 * fem, 0 * fem, 20 * fem, 0 * fem),
                              width: double.infinity,
                              height: 261 * fem,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f1f1),
                                borderRadius: BorderRadius.circular(60 * fem),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    // image2Rep (8:5)
                                    left: 0 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 381 * fem,
                                        height: 261 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30 * fem),
                                            color: const Color(0xff221c1c),
                                            border: const Border(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // barWy6 (19:112)
                                    left: 18 * fem,
                                    top: 43 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 350 * fem,
                                        height: 40 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10 * fem),
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // searchlocationvba (8:9)
                                    left: 61 * fem,
                                    top: 54 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 95 * fem,
                                        height: 17 * fem,
                                        child: Text(
                                          'Search Location',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Actor',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2025 * ffem / fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // searchinterfacesymbol2CJC (8:11)
                                    left: 313 * fem,
                                    top: 53 * fem,
                                    child: Align(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                     LandingScreen()),
                                          );
                                        },
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'assets/images/page-1/search-interface-symbol-2.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  _children[_page],
                                  Positioned(
                                      // barWy6 (19:112)
                                      left: 18 * fem,
                                      top: 183 * fem,
                                      child: Container(
                                        width: 350 * fem,
                                        height: 60 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(120 * fem),
                                          color: const Color(0xffffffff),
                                        ),
                                        child: BottomNavigationBar(
                                          onTap: (index) {
                                            setState(() {
                                              _page = index;
                                            });
                                          },
                                          backgroundColor: Colors.blue,
                                          items: [
                                            BottomNavigationBarItem(
                                              icon: Image.asset(
                                                'assets/images/page-1/truck-1.png',
                                                fit: BoxFit.cover,
                                                width: 50 * fem,
                                                height: 26 * fem,
                                              ),
                                              label: 'Home',
                                            ),
                                            BottomNavigationBarItem(
                                              icon: Image.asset(
                                                'assets/images/page-1/motorcycle-1.png',
                                                fit: BoxFit.cover,
                                                width: 40 * fem,
                                                height: 26 * fem,
                                              ),
                                              label: 'Search',
                                            ),
                                            BottomNavigationBarItem(
                                              icon: Image.asset(
                                                'assets/images/page-1/walk-1.png',
                                                fit: BoxFit.cover,
                                                width: 25 * fem,
                                                height: 26 * fem,
                                              ),
                                              label: 'Profile',
                                            ),
                                            BottomNavigationBarItem(
                                              icon: Image.asset(
                                                'assets/images/page-1/sport-car-1.png',
                                                fit: BoxFit.cover,
                                                width: 50 * fem,
                                                height: 26 * fem,
                                              ),
                                              label: 'Profile',
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ))),
    );
  }

  Widget _previewWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xff221c1c),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 20,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Drag Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: icons.map((icon) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.pink, size: 40),
                );
              }).toList())
        ],
      ),
    );
  }

  Widget _expandedWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xff221c1c),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: _child[_page],
    );
  }
}

class Walk extends StatefulWidget {
  const Walk({super.key});

  @override
  State<Walk> createState() => _WalkState();
}

class _WalkState extends State<Walk> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      child: Stack(children: [
        Positioned(
          // kmuiQ (8:12)
          left: 59 * fem,
          top: 104 * fem,
          child: Align(
            child: SizedBox(
              width: 57 * fem,
              height: 25 * fem,
              child: Text(
                "2 days",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Actor',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2025 * ffem / fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // shareQfA (15:705)
          left: 275.5 * fem,
          top: 105 * fem,
          child: Align(
            child: SizedBox(
              width: 58 * fem,
              height: 29 * fem,
              child: Text(
                'Share',
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
      ]),
    );
  }
}

class Truck extends StatefulWidget {
  const Truck({super.key});

  @override
  State<Truck> createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      child: Stack(children: [
        Positioned(
          // kmuiQ (8:12)
          left: 59 * fem,
          top: 104 * fem,
          child: Align(
            child: SizedBox(
              width: 57 * fem,
              height: 25 * fem,
              child: Text(
                "50 mins",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Actor',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2025 * ffem / fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // shareQfA (15:705)
          left: 275.5 * fem,
          top: 105 * fem,
          child: Align(
            child: SizedBox(
              width: 58 * fem,
              height: 29 * fem,
              child: Text(
                'Share',
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
      ]),
    );
  }
}

class Bike extends StatefulWidget {
  const Bike({super.key});

  @override
  State<Bike> createState() => _BikeState();
}

class _BikeState extends State<Bike> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      child: Stack(children: [
        Positioned(
          // kmuiQ (8:12)
          left: 59 * fem,
          top: 104 * fem,
          child: Align(
            child: SizedBox(
              width: 57 * fem,
              height: 25 * fem,
              child: Text(
                "1 hour 20 mins",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Actor',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2025 * ffem / fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // shareQfA (15:705)
          left: 275.5 * fem,
          top: 105 * fem,
          child: Align(
            child: SizedBox(
              width: 58 * fem,
              height: 29 * fem,
              child: Text(
                'Share',
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
      ]),
    );
  }
}

class Car extends StatefulWidget {
  const Car({super.key});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      child: Stack(children: [
        Positioned(
          // kmuiQ (8:12)
          left: 59 * fem,
          top: 104 * fem,
          child: Align(
            child: SizedBox(
              width: 57 * fem,
              height: 25 * fem,
              child: Text(
                "40 mins",
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Actor',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2025 * ffem / fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          // shareQfA (15:705)
          left: 275.5 * fem,
          top: 105 * fem,
          child: Align(
            child: SizedBox(
              width: 58 * fem,
              height: 29 * fem,
              child: Text(
                'Share',
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
      ]),
    );
  }
}

class TruckExapand extends StatefulWidget {
  const TruckExapand({super.key});

  @override
  State<TruckExapand> createState() => _TruckExapandState();
}

class _TruckExapandState extends State<TruckExapand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "This is Truck Page",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Head North for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Head South for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class BikeExpand extends StatefulWidget {
  const BikeExpand({super.key});

  @override
  State<BikeExpand> createState() => _BikeExpandState();
}

class _BikeExpandState extends State<BikeExpand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "This is Bike Page",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Head North for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Head South for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class WalkExpand extends StatefulWidget {
  const WalkExpand({super.key});

  @override
  State<WalkExpand> createState() => _WalkExpandState();
}

class _WalkExpandState extends State<WalkExpand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "This is Walk Page",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Head North for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Head South for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class CarExpand extends StatefulWidget {
  const CarExpand({super.key});

  @override
  State<CarExpand> createState() => _CarExpandState();
}

class _CarExpandState extends State<CarExpand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "This is Car Page",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Head North for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Head South for 50 meters",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}
