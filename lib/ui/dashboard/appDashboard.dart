import 'package:RefApp/landing_screen.dart';
import 'package:RefApp/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:RefApp/components/camera/camera.dart';
import 'package:RefApp/components/carto_poi_picking/cartopick.dart';
import 'package:RefApp/components/ev_routing/evrouting.dart';
import 'package:RefApp/components/offlinemaps/offlinemaps.dart';
import 'package:RefApp/components/publicTransit/transit.dart';
import 'package:RefApp/components/rasterlayers/rasterlayer.dart';
import 'package:RefApp/components/spacialaudio/spacialaudio.dart';
import 'package:RefApp/components/traffic.dart/traffic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final db = FirebaseFirestore.instance;

class SharedPrefers {
  static Future<DocumentSnapshot> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String message = prefs.getString('UID') ?? '';

    final jsonSnapshot = (await FirebaseFirestore.instance
        .collection('users')
        .doc(message)
        .get());

    return jsonSnapshot;
  }
}

class AppDashboard extends StatefulWidget {
  late final String documentId;

  // ignore: prefer_const_constructors_in_immutables
  AppDashboard({super.key});

  @override
  State<AppDashboard> createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {
  late Future<DocumentSnapshot> _futureDocument;
  late Future<DocumentSnapshot> _futureDoc;
  @override
  void initState() {
    super.initState();
    _getValueFromSharedPreferences();
  }

  Future<void> _getValueFromSharedPreferences() async {
    _futureDocument = SharedPrefers.getId();
    setState(() {
      _futureDoc = _futureDocument;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _futureDoc,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot<Object?>? documentSnapshot = snapshot.data;
          if (documentSnapshot!.exists) {
            Map<String, dynamic>? data =
                documentSnapshot.data() as Map<String, dynamic>?;
            return Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: <Widget>[
                  Center(
                    heightFactor: 1.2,
                    child: Container(
                      height: 325,
                      width: 330,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 245, 245, 1),
                        // gradient: const LinearGradient(
                        //   colors: [
                        //     Color.fromARGB(255, 92, 66, 207),
                        //     Color.fromARGB(255, 248, 247, 247)
                        //   ],
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        // ),
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(221, 243, 241, 241),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.menu_rounded,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    const SizedBox(
                                      width: 122,
                                    ),
                                    Text(
                                      ('${data!['FirstName']}'),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(197, 44, 44, 37),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const RegistrationPage()));
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                          data['ImageURL'],
                                          fit: BoxFit.cover,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 10,
                                              spreadRadius: 6,
                                            ),
                                          ],
                                          color: const Color.fromARGB(
                                              255, 165, 177, 165),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/images/page-1/pic.jpg',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        'Where is your Destination?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                hoverColor: Colors.amber.withOpacity(0.3),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => LandingScreen()));
                                },
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                  width: 200,
                                  height: 30,
                                  padding: EdgeInsets.only(
                                    left: 15,
                                    top: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 218, 218, 218),
                                  ),
                                  child: Text('Search Location',
                                      style: TextStyle(color: Colors.grey))),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                hoverColor: Colors.amber.withOpacity(0.3),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => LandingScreen()));
                                },
                                icon: Icon(
                                  Icons.my_location,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => OfflineMaps()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.offline_bolt,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Offline Maps',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => SpacialAudio()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.spatial_audio,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Spacial Audio',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Traffic()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.traffic,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Traffic',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => CarToPick()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.place,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Carto POI Picking',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => EvRouting()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.ev_station,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'EV Routing',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Transit()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.transit_enterexit,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Public Transit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => RasterLayers()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.layers,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Map Layers',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Camera()),
                              );
                            },
                            child: Container(
                              width: 320,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                color: Color.fromRGBO(34, 27, 27, 1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: Icon(
                                        Icons.camera,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(111, 111, 111, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(80, 80)),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Document does not exist'),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Center(
              child: AnimatedContainer(
            duration:
                const Duration(seconds: 2), // Set the duration of the animation
            child: const CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              backgroundColor: Colors.grey,
              value: 0.5, // current progress
              semanticsLabel: 'Loading',
              semanticsValue: 'Loading',
            ),
          ));
        }
      },
    );
  }
}
