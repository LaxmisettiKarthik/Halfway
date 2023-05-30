import 'package:flutter/material.dart';

class CustomColor {
  static const colorWhite = Color(0xFFFFFFFF);
  static const grey = Color(0xFF7F7F7F);
  static const colorBlack = Color(0xFF000000);
  static const colorYellow = Color(0xFFE1951F);
  static const linearYellow1 = Color(0xFFF49720);
  static const linearYellow2 = Color(0xFFFEC016);
  static const backGroundLinear = Color(0xFFFFB906);
  static const textFieldColor = Color(0xFFC4C4C4);
  static const fbBackground = Color(0xFF2F477A);
  static const orangeText = Color(0xFFDB3236);
  static const languageBackgroundColor = Color(0xFF041316);
  static const bgColor2 = Color(0xFF1D1F24);
  static const tabBarBackground = Color(0xFF212121);
  static const gradient1 = Color(0xFF39311C);
  // static const gradient1 = Color(0xFF342E1E);
  static const gradient2 = Color(0xFF272727);
  // static const gradient2 = Color(0xFF000000);
  // static const gradient2 = Color(0xFF050400);
  static const containerColor = Color(0xFF272727);
  static Color opacityColor = const Color(0xFF000000).withOpacity(.1);
  static Color pinkColor = const Color(0xffFFC0cB);
  static Color blueColor = const Color(0xff0000FF);
  static Color colorPinkDark = const Color(0xffFF007F);
  static Color colorGreen = const Color(0xff00d957);

  static Color convertColor(String color) {
    color = color.trim().replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF$color"));
    } else if (color.length == 8) {
      return Color(int.parse("0x$color"));
    } else {
      return Colors.white12;
    }
  }
}
