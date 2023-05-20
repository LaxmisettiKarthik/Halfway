import 'package:flutter/material.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart' as mapmyindia;
import 'package:mappls_gl/mappls_gl.dart' as mappls;

class MapMyIndiaProvider extends ChangeNotifier {
  List<mapmyindia.ELocation> placeList = [];
  late mappls.MapplsMapController mapController;
  String placeName = "";

  autoComplete(String text) async {
    if (text.length > 2) {
      try {
        mapmyindia.AutoSuggestResponse? response = await mapmyindia.MapmyIndiaAutoSuggest(query: text).callAutoSuggest();
        if (response != null && response.suggestedLocations != null) {
          placeList = response.suggestedLocations!;
        } else {
          placeList = [];
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      placeList = [];
    }
    notifyListeners();
  }

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
