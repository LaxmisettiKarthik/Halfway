import 'package:flutter/material.dart';
import 'package:mappls_gl/mappls_gl.dart' as mappls;

class MapplsProvider extends ChangeNotifier {
  List<mappls.ELocation> placeList = [];
  late mappls.MapplsMapController mapController;
  String placeName = "";

  

 goToLocation(mappls.ELocation location) {
  placeName = location.placeName ?? "";
  double latitude = location.latitude ?? 0.0;
  double longitude = location.longitude ?? 0.0;
  mapController.moveCamera(
    mappls.CameraUpdate.newLatLngZoom(mappls.LatLng(latitude, longitude), 14));
  placeList = [];
  notifyListeners();
}

  moveToCurrentLocation(double lat, double long) {
    // Use moveCamera method to move the camera to the current location
    mapController.moveCamera(mappls.CameraUpdate.newLatLng(
        mappls.LatLng(lat, long)));
    placeList = [];
    notifyListeners();
  }
}
