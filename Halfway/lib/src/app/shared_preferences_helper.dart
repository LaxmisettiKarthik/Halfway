import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class SharedPreferencesHelper {
  static SharedPreferences? prefs;

  static initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// ------------------------------------------------------------
  /// Method that returns the user login or not , null if not set
  /// ------------------------------------------------------------
  static bool isLogin() {
    bool? isLogin;
    isLogin = prefs?.getBool(ConstantsValues.isLogin) ?? false;
    return isLogin;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user login
  /// ----------------------------------------------------------
  static Future<bool?> setIsLogin(bool isLogin) async {
    return await prefs?.setBool(ConstantsValues.isLogin, isLogin);
  }
}
