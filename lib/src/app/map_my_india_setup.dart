import 'package:kartihk_map/src/constants/constants.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class MapMyIndiaSetup {
  static initKeys() {
    MapmyIndiaAccountManager.setMapSDKKey(ConstantsValues.mapMyIndiaKey);
    MapmyIndiaAccountManager.setRestAPIKey(ConstantsValues.mapMyIndiaKey);
    MapmyIndiaAccountManager.setAtlasClientId(
        ConstantsValues.mapMyIndiaClientId);
    MapmyIndiaAccountManager.setAtlasClientSecret(
        ConstantsValues.mapMyIndiaClientSecret);
  }
}
