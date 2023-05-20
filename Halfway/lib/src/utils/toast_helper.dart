import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/custom_colors.dart';

class ToastHelper {
  static showToast(String message, {ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: CustomColor.colorWhite,
        textColor: CustomColor.colorBlack,
        fontSize: 16.0);
  }

  static showErrorToast(BuildContext context, String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: CustomColor.colorWhite,
        fontSize: 12.0);
  }
}
