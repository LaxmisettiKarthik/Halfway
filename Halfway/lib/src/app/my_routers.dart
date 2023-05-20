import 'package:flutter/material.dart';
import 'package:kartihk_map/src/screens/home/home_screen.dart';
import 'package:kartihk_map/src/screens/login/login_screen.dart';
import 'package:kartihk_map/src/screens/map/map_my_india_screen.dart';

import '../screens/map/map_my_india_place_search.dart';
import '../screens/map/map_screen.dart';
import '../screens/welcome/splash_screen.dart';

class MyRouters {
  static const String splash = "/splash";

  static const String login = "/login";

  static const String homeScreen = "/home_screen";

  static const String googleMapScreen = "/map_screen";

  static const String mapMyIndiaScreen = "/map_my_screen";

  static const String mapMyIndiaPlaceSearchScreen = "/map_my_screen_place_search";

  static const String OnBoardingScreen  = "/onboard";

  

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

      // case googleMapScreen:
      //   return MaterialPageRoute(
      //       settings: const RouteSettings(name: googleMapScreen),
      //       builder: (context) {
      //         return const MapScreen();
      //       });

      case mapMyIndiaScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: mapMyIndiaScreen),
            builder: (context) {
              return const MapMyIndiaScreen();
            });

      // case mapMyIndiaPlaceSearchScreen:
      //   return MaterialPageRoute(
      //       settings: const RouteSettings(name: mapMyIndiaPlaceSearchScreen),
      //       builder: (context) {
      //         return const PlaceSearchWidget();
      //       });
            

      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: splash),
            builder: (context) {
              return const SplashScreen();
            });
    }
  }
}
