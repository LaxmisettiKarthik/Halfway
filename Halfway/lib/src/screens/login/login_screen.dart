import 'package:flutter/material.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/app/shared_preferences_helper.dart';
import 'package:kartihk_map/src/constants/custom_colors.dart';
import 'package:kartihk_map/src/screens/login/signin.dart';
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
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SignIn()),
                      );
                    },
                    child: const Text("Sign via Email"),
                  ),
                ],
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
