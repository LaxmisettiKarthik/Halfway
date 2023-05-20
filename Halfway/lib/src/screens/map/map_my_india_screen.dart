import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kartihk_map/src/app/mediaquery_class.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/constants/custom_colors.dart';
import 'package:kartihk_map/src/viwModel/map_my_india_provider.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart' as mapmyindia;
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../all_translations.dart';
import '../../utils/toast_helper.dart';
import 'package:mappls_gl/mappls_gl.dart' as mappls;

class MapMyIndiaScreen extends StatefulWidget {
  const MapMyIndiaScreen({Key? key}) : super(key: key);

  @override
  State<MapMyIndiaScreen> createState() => _MapMyIndiaScreenState();
}

class _MapMyIndiaScreenState extends State<MapMyIndiaScreen> {
  late MapMyIndiaProvider provider;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MapMyIndiaProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          mappls.MapplsMap(
            //myLocationEnabled: true,
            compassEnabled: true,
            myLocationTrackingMode: mappls.MyLocationTrackingMode.TrackingGPS,
            myLocationRenderMode: mappls.MyLocationRenderMode.GPS,

            initialCameraPosition: const mappls.CameraPosition(
              target:mappls.LatLng(17.424452, 78.432621),
              zoom: 14.0,
            ),
            onMapCreated: (map) => {
             provider.mapController = map,
              _getCurrentLocation(),
              _addCurrentLocationSymbol(),
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

  Future<bool> checkPermissionForCurrentLocation() async {
    bool? serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ToastHelper.showToast(allTranslations.text('Your location is off.'));
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      print(statuses[Permission.location]);
      var status = await Permission.location.status;
      if (status.isGranted) {
        return true;
      }
    }

    return false;
  }

   Future<void> _getCurrentLocation() async {
    bool locationStatus = await checkPermissionForCurrentLocation();
    if (locationStatus == false) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    provider.moveToCurrentLocation(position.latitude, position.longitude);
    provider.mapController.animateCamera(mappls.CameraUpdate.newLatLngZoom(
        mappls.LatLng(position.latitude, position.longitude), 19.0));
    // await _getAddress();
  }

  void _addCurrentLocationSymbol() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    provider.mapController.addSymbol(
        mappls.SymbolOptions(geometry: mappls.LatLng(position.latitude, position.longitude)));
  }
}
