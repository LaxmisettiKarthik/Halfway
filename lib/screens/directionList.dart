import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:halfway/screens/utils.dart';

class DirectionList extends StatefulWidget {
  const DirectionList({super.key});

  @override
  State<DirectionList> createState() => _DirectionListState();
}

class _DirectionListState extends State<DirectionList> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          // iphone14promax31bk (1:25)
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff5681ca),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // statusbarrkn (1:26)
                height: 44 * fem,
              ),
              Container(
                // autogroup2o4jaXg (DXYcreZgHAErxyLUYi2o4J)
                padding:
                    EdgeInsets.fromLTRB(24 * fem, 26 * fem, 67 * fem, 26 * fem),
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        // rightarrow13sWn (1:50)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 44 * fem, 1 * fem),
                        width: 40 * fem,
                        height: 40 * fem,
                        child: const Icon(Icons.turn_right_sharp)),
                    const Text(
                      // directionslistNiS (1:44)
                      'Directions List',
                      style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupmej86uL (DXYdQxyAPCwjBA74jpmej8)
                padding: EdgeInsets.fromLTRB(
                    28 * fem, 42 * fem, 36.94 * fem, 652.5 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogroupd63qqM8 (DXYd2j7DcggTkviTFYd63Q)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 169.06 * fem, 24.5 * fem),
                      width: double.infinity,
                      height: 71 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroupdpvcnfg (DXYd996CU242SiW5LSdpVC)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 21 * fem, 19 * fem),
                            padding: EdgeInsets.fromLTRB(
                                5 * fem, 2 * fem, 0 * fem, 3 * fem),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20 * fem),
                            ),
                            child: Align(
                              // turnright11HcS (1:48)
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                  width: 35 * fem,
                                  height: 35 * fem,
                                  child: const Icon(Icons.turn_right)),
                            ),
                          ),
                          Container(
                            // autogroupgaduPfU (DXYdDUJKDt3XJBf3LjgaDU)
                            width: 135 * fem,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // turnrightLKp (1:45)
                                  width: double.infinity,
                                  child: const Text(
                                    'Turn Right',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  // mT9Y (1:46)
                                  width: double.infinity,
                                  child: const Text(
                                    '60m',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // line3azr (1:49)
                      margin: EdgeInsets.fromLTRB(
                          3.94 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: 361.11 * fem,
                      height: 1 * fem,
                      decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
