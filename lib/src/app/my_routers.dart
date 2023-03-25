import 'package:flutter/material.dart';
import 'package:kartihk_map/src/screens/home/home_screen.dart';
import 'package:kartihk_map/src/screens/login/login_screen.dart';

import '../screens/map/map_screen.dart';
import '../screens/welcome/splash_screen.dart';

class MyRouters {
  static const String splash = "/splash";

  static const String login = "/login";

  static const String homeScreen = "/home_screen";

  static const String mapScreen = "/map_screen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
            settings: const RouteSettings(name: login),
            builder: (context) {
              return const LoginScreen();
            });

      case homeScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: homeScreen),
            builder: (context) {
              return const HomeScreen();
            });

      case mapScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: mapScreen),
            builder: (context) {
              return const MapScreen();
            });

      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: splash),
            builder: (context) {
              return const SplashScreen();
            });
    }
  }
}
