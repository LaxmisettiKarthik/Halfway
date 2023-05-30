import 'package:halfwaynew/src/constants/constants.dart';
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
