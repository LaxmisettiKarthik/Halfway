import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:kartihk_map/src/viwModel/map_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../all_translations.dart';
import '../../constants/constants.dart';
import '../../constants/custom_colors.dart';
import '../../models/place_search_model.dart';
import '../../utils/toast_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen();
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController? mapController;
  Geolocator? geoLocator;
  late Position position;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _markerIdCounter = 1;
  late Position _currentPosition;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<PolylineId, Polyline> polylines = {};
  List<ItemLatALng> latLngList = [];
  Map<String, dynamic> test = {};
  Set<Polygon> _polygons = HashSet<Polygon>();
  int _polygonIdCounter = 1;
  List<LatLng> polygonLatLongs = [];
  int i = 0;
  String p = "P_";
  TextEditingController nameText = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  final FocusNode _focusNode = FocusNode();
  final kStyle = const TextStyle(
      fontSize: 22, color: CustomColor.colorBlack, fontWeight: FontWeight.bold);
  final ScrollController _scrollController = ScrollController();
  String? mobile;
  bool isFirstTime = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    mapProvider.clearPlacesData();
    init();
    googlePlace = GooglePlace(ConstantsValues.googleMapKey);
  }

  init() async {}

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      mapProvider.getPlacesData(result.predictions ?? []);
    } else {
      mapProvider.getPlacesData([]);
    }
  }

  void _add(double lat, double long) {
    polygonLatLongs.add(LatLng(lat, long));
    _setPolygon();
    final int markerCount = markers.length;

    if (markerCount == 100) {
      return;
    }
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;

    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        lat,
        long,
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {},
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void remove() {
    if (test.length == 1) {
      test.clear();
      i = i - 1;
      polygonLatLongs.clear();
      _polygons.clear();
    } else {
      if (test.length > 1) {
        test.removeWhere((key, value) => key == p + i.toString());
        i = i - 1;
        // _polygons.removeWhere((element) => element.points.last.latitude == polygonLatLongs.last.latitude );
        polygonLatLongs.removeLast();
        _setPolygon();
      }
    }
    if (markers.isNotEmpty) {
      markers.removeWhere((key, value) =>
          key == MarkerId("marker_id_${(markers.length).toString()}"));
      _markerIdCounter = _markerIdCounter - 1;
    }
    setState(() {});
  }

  void removeAll() {
    if (test.isNotEmpty) {
      markers.clear();
      _markerIdCounter = 1;
      test.clear();
      i = 0;
      polygonLatLongs.clear();
      _polygons.clear();
    }

    setState(() {});
  }

  _getCurrentLocation() async {
    bool locationStatus = await checkPermissionForCurrentLocation();
    if (locationStatus == false) {
      return;
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      //await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  void getPlaceDetails(String placeId) async {
    double lat = 0.00;
    double long = 0.00;
    var result = await this.googlePlace.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      lat = result.result!.geometry!.location!.lat ?? 0.00;
      long = result.result!.geometry!.location!.lng ?? 0.00;
      _focusNode.unfocus();
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, long),
            zoom: 18.0,
          ),
        ),
      );
      mapProvider.clearPlacesData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: Scaffold(
          key: _scaffoldKey,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40,
                  width: 35,
                  child: FloatingActionButton(
                    heroTag: "2",
                    backgroundColor: CustomColor.colorWhite,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.add_rounded,
                      color: CustomColor.colorBlack,
                      size: 25,
                    ),
                    onPressed: () {
                      mapController?.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 35,
                  child: FloatingActionButton(
                    heroTag: "1",
                    backgroundColor: CustomColor.colorWhite,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.remove,
                      color: CustomColor.colorBlack,
                      size: 25,
                    ),
                    onPressed: () {
                      mapController?.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 35,
                  child: FloatingActionButton(
                    heroTag: "0",
                    backgroundColor: CustomColor.colorWhite,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: SvgPicture.asset(
                        "assets/svg/current_location_icon.svg"),
                    onPressed: () {
                      _getCurrentLocation();
                    },
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                polygons: _polygons,
                polylines: Set<Polyline>.of(polylines.values),
                onTap: (v) {
                  if (_focusNode.hasFocus) {
                    _searchController.clear();
                    mapProvider.clearPlacesData();
                    _focusNode.unfocus();
                  } else {
                    _add(v.latitude, v.longitude);
                    if (test.isEmpty) {
                      test.addEntries({
                        'a': {'Latitude': v.latitude, 'Longitude': v.longitude},
                      }.entries);
                    } else {
                      i = i + 1;
                      String s = p + i.toString();
                      test.addEntries({
                        s: {'Latitude': v.latitude, 'Longitude': v.longitude},
                      }.entries);
                    }
                  }
                },
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.hybrid,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: CustomColor.colorBlack, width: 1),
                          color: CustomColor.colorWhite),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<PlaceSearchModel>(
                              stream: mapProvider.predictions.stream,
                              builder: (context, snapshot) {
                                return Visibility(
                                  visible: _searchController.text.length > 0,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.keyboard_arrow_left),
                                    onPressed: () {
                                      _searchController.clear();
                                      _focusNode.unfocus();
                                      mapProvider.clearPlacesData();
                                    },
                                  ),
                                  replacement: Icon(Icons.search),
                                );
                              }),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              // maxLength: 50,
                              maxLines: 1,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                              controller: _searchController,
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 10),
                                hintText: allTranslations.text("Search"),
                              ),
                              onChanged: (value) {
                                if (value.length > 0) {
                                  autoCompleteSearch(value);
                                } else {
                                  mapProvider.clearPlacesData();
                                }
                              },
                            ),
                          ),
                          StreamBuilder<PlaceSearchModel>(
                              stream: mapProvider.predictions.stream,
                              builder: (context, snapshot) {
                                return Visibility(
                                    visible:
                                        _searchController.text.trim().length >
                                            0,
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          mapProvider.clearPlacesData();
                                          _searchController.clear();
                                        },
                                        icon: Icon(Icons.close)));
                              }),
                        ],
                      ),
                    ),
                    StreamBuilder<PlaceSearchModel>(
                        stream: mapProvider.predictions.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isReset) {
                              return Container();
                            }
                            if (snapshot.data!.predictions!.isEmpty ||
                                snapshot.data!.predictions == [] &&
                                    snapshot.data!.isReset == false) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 40,
                                padding: EdgeInsets.all(10),
                                color: CustomColor.colorWhite,
                                child: Center(
                                  child: Text(
                                      allTranslations.text("No result found")),
                                ),
                              );
                            }
                            return Flexible(
                              child: Container(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        (MediaQuery.of(context).size.height /
                                                2) -
                                            100),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                // height: 200,
                                color: CustomColor.colorWhite,
                                child: Scrollbar(
                                  controller: _scrollController,
                                  isAlwaysShown: true,
                                  thickness: 4,
                                  hoverThickness: 5,
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    itemCount:
                                        snapshot.data!.predictions!.length,
                                    itemBuilder: (context, index) {
                                      AutocompletePrediction data =
                                          snapshot.data!.predictions![index];
                                      return ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        leading: CircleAvatar(
                                          child: Icon(
                                            Icons.pin_drop,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(
                                          data.description!,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onTap: () {
                                          _searchController.text =
                                              data.description ?? "";
                                          getPlaceDetails(data.placeId ?? "");
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Draw Polygon to the map
  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLongs,
      strokeWidth: 2,
      strokeColor: CustomColor.orangeText,
      fillColor: CustomColor.blueColor.withOpacity(0.15),
    ));
    _polygonIdCounter = _polygonIdCounter + 1;
    setState(() {});
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
}

class ItemLatALng {
  double? Latitude;
  double? Longitude;
}
