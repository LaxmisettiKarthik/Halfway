import 'package:flutter/material.dart';

class MediaQueryClass {
  static late double height;
  static late double width;

  static setMediaQuery(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    height = mediaQueryData.size.height;
    width = mediaQueryData.size.width;
  }
}
