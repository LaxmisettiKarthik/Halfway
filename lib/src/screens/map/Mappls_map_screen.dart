import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halfwaynew/src/viwModel/mappls_provider.dart';
import 'package:mappls_gl/mappls_gl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../all_translations.dart';
import '../../utils/toast_helper.dart';
import 'package:mappls_gl/mappls_gl.dart' as mappls;
import 'package:mappls_place_widget/mappls_place_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:mappls_direction_plugin/mappls_direction_plugin.dart';

class MapplsMapScreen extends StatefulWidget {
  const MapplsMapScreen({Key? key}) : super(key: key);

  @override
  State<MapplsMapScreen> createState() {
    return _MapplsMapScreenState();
    }
}

class _MapplsMapScreenState extends State<MapplsMapScreen> {
  late MapplsProvider provider;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MapplsProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          mappls.MapplsMap(
            //myLocationEnabled: true,
            compassEnabled: true,
            myLocationTrackingMode: mappls.MyLocationTrackingMode.TrackingGPS,
            myLocationRenderMode: mappls.MyLocationRenderMode.GPS,

            initialCameraPosition: const mappls.CameraPosition(
              target: mappls.LatLng(17.424452, 78.432621),
              zoom: 14.0,
            ),
            onMapCreated: (map) => {
              provider.mapController = map,
              _getCurrentLocation(),
              _addCurrentLocationSymbol(),
            },
          ),
          SafeArea(
              child: Column(
            children: [
              TextButton(
                  onPressed: openMapplsSearchWidget,
                  child: const Text("Open Place Autocomplete")
                  ),
              TextButton(
                onPressed: 
                  openMapplsDirectionWidget,
                child: const Text("directions"),
                
              ),
            ],
          )),
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

  Future<void> openMapplsDirectionWidget() async {
     DirectionCallback directionCallback;
    print("function called");
    
      try {
        print("try block called");
        directionCallback = await openDirectionWidget(
            directionOptions: DirectionOptions(
                showStartNavigation: true,
                showAlternative: true,
                resource: DirectionCriteria.RESOURCE_ROUTE_TRAFFIC,
                profile: DirectionCriteria.PROFILE_DRIVING,
                searchPlaceOption: PlaceOptions(
                    enableTextSearch: true, hint: "search Location"),
                    )
                    );
        print("function line");
        print(directionCallback);
      } on PlatformException {
        print('platform exception occured');
        directionCallback = DirectionCallback(null, null);
      }
      if (kDebugMode) {
        print('direction visible');
        print(json.encode(directionCallback.directionResponse?.toMap()));
      }
    
    if (!mounted) {
      print("not mounted");
      return;
    }
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
    provider.mapController.addSymbol(mappls.SymbolOptions(
        geometry: mappls.LatLng(position.latitude, position.longitude)));
  }

  openMapplsSearchWidget() async {
    AutocompleteResult autocompleteResult;
    try {
      autocompleteResult = await openPlaceAutocomplete(
          PlaceOptions(enableTextSearch: true, hint: "search Location"));
    } on PlatformException {
      autocompleteResult = AutocompleteResult();
    }
    if (kDebugMode) {
      print(json.encode(autocompleteResult.toJson()));
    }

    if (!mounted) return;

    ELocation eLocation;
    if (autocompleteResult.eLocation != null) {
      eLocation = autocompleteResult.eLocation!;
      String? x = autocompleteResult.eLocation!.mapplsPin;
      provider.mapController.moveCameraWithMapplsPin(
          CameraMapplsPinUpdate.newMapplsPinZoom(x!, 14));

      print(eLocation);
    } else {
      eLocation = ELocation();
    }
    
  }
}
