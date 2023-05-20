import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:halfway/screens/utils.dart';

class PlanRide extends StatefulWidget {
  PlanRide({super.key});

  @override
  State<PlanRide> createState() => _PlanRideState();
}

class _PlanRideState extends State<PlanRide> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan a ride"),
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
      ),
      body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 63, 74, 87)),
          child: Column(
            children: [
              Container(
                  height: 125,
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 3), // Offset from the container
                      ),
                    ],
                    color: Color(0xff221c1c),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        // destinationmui (2:12)
                        left: 74 * fem,
                        top: 71 * fem,
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
                        top: 54 * fem,
                        child: Align(
                          child: SizedBox(
                              width: 235 * fem,
                              height: 29 * fem,
                              child: const Divider(
                                thickness: 1,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                      Positioned(
                        // yourlocationvZe (2:5)
                        left: 74 * fem,
                        top: 25 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 141 * fem,
                            height: 29 * fem,
                            child: const TextField(
                                decoration: InputDecoration(
                                    hintText: "Your Location",
                                    hintStyle: TextStyle(color: Colors.white))),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.grey, // Background color of the button
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Button padding
                    ),
                    child: const Text(
                      "Start Date",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.grey, // Background color of the button
                        foregroundColor: Colors.white, // Text color
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // Button padding
                      ),
                      onPressed: () {},
                      child: const Text(
                        "End Date",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: const Alignment(0, 1),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.grey, // Background color of the button
                    foregroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Button padding
                  ),
                  child: const Text(
                    "Time",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Icon(
                          Icons.work,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Office",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "Saved places",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "History",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
