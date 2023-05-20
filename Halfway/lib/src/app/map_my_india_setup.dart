import 'package:kartihk_map/src/constants/constants.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapMyIndiaSetup {
  static initKeys() {
    MapplsAccountManager.setMapSDKKey(ConstantsValues.mapMyIndiaKey);
    MapplsAccountManager.setRestAPIKey(ConstantsValues.mapMyIndiaKey);
    MapplsAccountManager.setAtlasClientId(
        ConstantsValues.mapMyIndiaClientId);
    MapplsAccountManager.setAtlasClientSecret(
        ConstantsValues.mapMyIndiaClientSecret);
  }
}
