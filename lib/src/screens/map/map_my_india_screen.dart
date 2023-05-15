import 'package:flutter/material.dart';
import 'package:kartihk_map/src/app/mediaquery_class.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/constants/custom_colors.dart';
import 'package:kartihk_map/src/viwModel/map_my_india_provider.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:provider/provider.dart';



class MapMyIndiaScreen extends StatefulWidget {
  const MapMyIndiaScreen({Key? key}) : super(key: key);

  @override
  State<MapMyIndiaScreen> createState() => _MapMyIndiaScreenState();
}

class _MapMyIndiaScreenState extends State<MapMyIndiaScreen> {
  late MapMyIndiaProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MapMyIndiaProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          MapmyIndiaMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(25.321684, 82.987289),
              zoom: 14.0,
            ),
            onMapCreated: (map) => {
              provider.mapController = map,
            },
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, MyRouters.mapMyIndiaPlaceSearchScreen);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQueryClass.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    color: CustomColor.colorWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: CustomColor.colorBlack)),
                child: Text(
                    provider.placeName == "" ? "Search" : provider.placeName),
              ),
            ),
          )
        ],
      ),
    );
  }
}
