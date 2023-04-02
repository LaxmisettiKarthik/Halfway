import 'package:flutter/material.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class MapMyIndiaProvider extends ChangeNotifier {
  List<ELocation> placeList = [];
  late MapmyIndiaMapController mapController;
  String placeName = "";

  autoComplete(String text) async {
    if (text.length > 2) {
      try {
        AutoSuggestResponse? response =
            await MapmyIndiaAutoSuggest(query: text).callAutoSuggest();
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

  goToLocation(ELocation location) {
    placeName = location.placeName ?? "";
    mapController.moveCameraWithELoc(
        CameraELocUpdate.newELocZoom(location.eLoc ?? "", 14));
    placeList = [];
    notifyListeners();
  }
}
