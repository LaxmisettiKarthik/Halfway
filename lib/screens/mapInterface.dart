import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:halfway/screens/directionList.dart';

class MapInterface extends StatefulWidget {
  const MapInterface({super.key});

  @override
  State<MapInterface> createState() => _MapInterfaceState();
}

class _MapInterfaceState extends State<MapInterface> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
        width: double.infinity,
        child: Container(
            // iphone14promax31bk (1:25)
            width: double.infinity,
            decoration:  BoxDecoration(
              color: const Color.fromARGB(255, 128, 128, 128),
              borderRadius: BorderRadius.circular(20),
              //const Color(0xff221c1c),
            ),
            child: Stack(
              children: [
              Container(
                // autogroup2o4jaXg (DXYcreZgHAErxyLUYi2o4J)
                margin: EdgeInsets.only(top: 40),
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 26 * fem, 67 * fem, 26 * fem),
                width: double.infinity,

                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 13, 66, 253),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        // rightarrow13sWn (1:50)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 44 * fem, 1 * fem),
                        width: 40 * fem,
                        height: 50 * fem,
                        child: const Icon(
                          Icons.turn_right_sharp,
                          color: Colors.white,
                          size: 50,
                        )),
                    const Text(
                      // directionslistNiS (1:44)
                      'Turn right',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 150 * fem,
                      decoration: const BoxDecoration(
                        color: const Color(0xff221c1c),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Text(
                                "20KM",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          Row(
                            children: [
                              const Text(
                                "5 mins",
                                // textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              ),
                              new Spacer(),
                              Align(
                                alignment: Alignment(1.00, 0.5),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DirectionList()),
                                      );
                                    },
                                    child: Row(children: const [
                                      Icon(
                                        Icons.menu_open,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Directions",
                                        style: TextStyle(
                                          fontSize: 13,
                                          decoration: TextDecoration.none,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15 * fem,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Arrival time: 11:00pm",
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      )))
            ])));
  }
}
