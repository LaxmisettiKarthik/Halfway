import 'package:RefApp/components/camera/camera.dart';
import 'package:RefApp/components/carto_poi_picking/cartopick.dart';
import 'package:RefApp/components/ev_routing/evrouting.dart';
import 'package:RefApp/components/offlinemaps/offlinemaps.dart';
import 'package:RefApp/components/publicTransit/transit.dart';
import 'package:RefApp/components/rasterlayers/rasterlayer.dart';
import 'package:RefApp/components/spacialaudio/spacialaudio.dart';
import 'package:RefApp/components/traffic.dart/traffic.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> items = <Widget>[
    const Column(
      children: [
        Icon(
          Icons.offline_bolt,
          size: 85,
        ),
        Text(
          'Offline Maps',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.spatial_audio,
          size: 85,
        ),
        Text(
          'Spacial Audio Navigation',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.traffic,
          size: 85,
        ),
        Text(
          'Traffic',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.place,
          size: 85,
        ),
        Text(
          'Carto poi picking',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.ev_station,
          size: 85,
        ),
        Text(
          'EV Routing',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.transit_enterexit,
          size: 85,
        ),
        Text(
          'Public Transit',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.layers,
          size: 85,
        ),
        Text(
          'Custom layers',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
    const Column(
      children: [
        Icon(
          Icons.camera,
          size: 85,
        ),
        Text(
          'Camera Move',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        )
      ],
    ),
  ];

final List<MaterialPageRoute> routes = [
    MaterialPageRoute(builder: (context) => const OfflineMaps()),
    MaterialPageRoute(builder: (context) => const SpacialAudio()),
    MaterialPageRoute(builder: (context) => const Traffic()),
    MaterialPageRoute(builder: (context) => const CarToPick()),
    MaterialPageRoute(builder: (context) => const EvRouting()),
    MaterialPageRoute(builder: (context) => const Transit()),
    MaterialPageRoute(builder: (context) => const RasterLayers()),
    MaterialPageRoute(builder: (context) => const Camera()),

  ];


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        padding: EdgeInsets.all(16.0),
        children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, routes[index]);
            },
            child: Container(
              child: Center(
                child: items[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}