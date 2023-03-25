import 'package:flutter/material.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/app/shared_preferences_helper.dart';
import 'package:kartihk_map/src/constants/custom_colors.dart';
import 'package:kartihk_map/src/utils/toast_helper.dart';
import 'package:kartihk_map/src/viwModel/login_provider.dart';

import '../../utils/popup_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blueColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InkWell(
              onTap: () {
                _googleLogin(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColor.colorWhite),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/google_icon.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _googleLogin(BuildContext context) async {
    PopupHelper().showLoaderDialog(context);
    bool response = await LoginProvider().signInWithGoogle();
    if (response) {
      SharedPreferencesHelper.setIsLogin(true);
      Navigator.pushNamedAndRemoveUntil(
          context, MyRouters.homeScreen, (route) => false);
    } else {
      ToastHelper.showToast("Something went wrong please try again");
    }
  }
}
