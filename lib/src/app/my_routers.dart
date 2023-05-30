import 'package:flutter/material.dart';
import 'package:halfwaynew/src/screens/OnboardingScreen/onBoard.dart';
import 'package:halfwaynew/src/screens/loginPages/login_screen.dart';
import 'package:halfwaynew/src/screens/map/mappls_map_screen.dart';



class MyRouters {
  static const String login = "/login";

  static const String mapplsScreen = "/mappls_screen";

  static const String onBoardingScreen  = "/onboard";

  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
            settings: const RouteSettings(name: login),
            builder: (context) {
              return const LoginScreen();
            });

     

      case mapplsScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: mapplsScreen),
            builder: (context) {
              return const MapplsMapScreen();
            });

     

      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: onBoardingScreen),
            builder: (context) {
              return  const OnBoardingScreen();
            });
    }
  }
}
