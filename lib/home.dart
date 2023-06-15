import 'package:RefApp/publicTransit/publictransit.dart';
import 'package:RefApp/traffic/traffic.dart';
import 'package:flutter/material.dart';
import 'camera/camera.dart';
import 'custom raster layers/customraster.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HalfWay..')),
      body: Center(
        child: ListView(
          children: [
            // ListTile(
            //     title: Text(' Go to map'),
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => Map(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     title: Text('Search'),
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => Search(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     //getting crashed
            //     title: Text('Routing'),
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => Routing(),
            //         ),
            //       );
            //     }),
            ListTile(
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Camera(),
                    ),
                  );
                }),
            ListTile(
                title: Text('Traffic'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Traffic(),
                    ),
                  );
                }),
            ListTile(
                //getting crashed
                title: Text('Public Transit'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PublicTransit(),
                    ),
                  );
                }),
            ListTile(
                title: Text('Custom Raster Layers'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CustomRasterLayers(),
                    ),
                  );
                }),
            // ListTile(
            //     //getting crashed
            //     title: Text('Navigation'),
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => Navigation(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //   //getting crashed
            //   title: Text('Navigation 2.0'),
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => Navigate(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
