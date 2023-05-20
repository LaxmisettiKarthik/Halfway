import 'package:google_place/google_place.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import '../models/place_search_model.dart';

class MapProvider {
  final BehaviorSubject<List<String>> _farmFeildSensedDays =
      BehaviorSubject<List<String>>();
  final BehaviorSubject<List<String>> _farmFeildSensedDaysControl =
      BehaviorSubject<List<String>>();
  final BehaviorSubject<String> _imageTypeName = BehaviorSubject<String>();
  final BehaviorSubject<String> _fieldNameData = BehaviorSubject<String>();

  final BehaviorSubject<String> _weatherGraph = BehaviorSubject<String>();
  final BehaviorSubject<PlaceSearchModel> _predictions =
      BehaviorSubject<PlaceSearchModel>();
  final BehaviorSubject<String> _dropDownValue = BehaviorSubject<String>();
  List<String> senseDays = [];

  final BehaviorSubject<String> _farmonautVisibilityStatus =
      BehaviorSubject<String>();

  String _fieldId = "";
  String _senseday = "";
  String _imageType = "";
  String _colorMap = "";

  // final BehaviorSubject<List<ItemLatALng>> _latLongData =
  //     BehaviorSubject<List<ItemLatALng>>();

  // final BehaviorSubject<FarmWeatherData> _farmFeildWeatherData =
  //     BehaviorSubject<FarmWeatherData>();

  getPlacesData(List<AutocompletePrediction> result) async {
    PlaceSearchModel p = PlaceSearchModel();
    p.predictions = result;
    _predictions.sink.add(p);
  }

  clearPlacesData() async {
    PlaceSearchModel p = PlaceSearchModel();
    p.predictions = [];
    p.isReset = true;
    _predictions.sink.add(p);
  }

  setFieldId(String id) {
    _fieldId = id;
  }

  setSenseDay(String senseDay) {
    _senseday = senseDay;
  }

  setImageType(String imageType) {
    _imageType = imageType;
  }

  setColorMap(String colorMap) {
    _colorMap = colorMap;
  }

  static String _convertDate(String timestamp) {
    return DateFormat("dd-MM-yyyy").format(DateTime.parse(timestamp));
  }

  String biggerDate(List<String> date) {
    String minDate = "";
    if (date.length > 0) {
      minDate = date.first;
      date.forEach((element) {
        if (int.parse(minDate) < int.parse(element)) {
          minDate = element;
        }
      });
    }
    return minDate;
  }

  setFarmonautVisibility(String query) {
    _farmonautVisibilityStatus.sink.add(query);
  }

  dispose() {
    _farmFeildSensedDaysControl.close();
    _weatherGraph.close();
    _imageTypeName.close();
    _predictions.close();
    _fieldNameData.close();
    _farmonautVisibilityStatus.close();
  }

  BehaviorSubject<List<String>> get farmFeildSensedDays => _farmFeildSensedDays;
  BehaviorSubject<List<String>> get farmFeildSensedDaysControl =>
      _farmFeildSensedDaysControl;

  BehaviorSubject<String> get weatherGraph => _weatherGraph;
  BehaviorSubject<String> get imageTypeName => _imageTypeName;

  BehaviorSubject<PlaceSearchModel> get predictions => _predictions;

  BehaviorSubject<String> get dropDownValue => _dropDownValue;
  BehaviorSubject<String> get fieldNameDate => _fieldNameData;
  BehaviorSubject<String> get farmonautVisibilityStatus =>
      _farmonautVisibilityStatus;

  String get fieldId => _fieldId;
  String get senseday => _senseday;
  String get imageType => _imageType;
  String get colorMap => _colorMap;
}

MapProvider mapProvider = MapProvider();
