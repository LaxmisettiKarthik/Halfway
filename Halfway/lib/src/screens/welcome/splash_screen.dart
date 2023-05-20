import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/app/shared_preferences_helper.dart';
import 'package:kartihk_map/src/constants/custom_colors.dart';

import '../../app/mediaquery_class.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryClass.setMediaQuery(context);
    return Scaffold(
      body: Container(
        height: MediaQueryClass.height,
        width: MediaQueryClass.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/google_icon.png"),
                fit: BoxFit.cover)),
        child: ScreenUtilInit(builder: (context, snapshot) {
          return Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 200,
                    width: MediaQueryClass.width / 2,
                    child: const Center(
                      child: Text(
                        "Logo Here",
                        style: TextStyle(
                            color: CustomColor.colorWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
              // const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 30),
              //   child: Image.asset(
              //     "assets/icons/tuteehub_powered.png",
              //     height: 50,
              //     width: MediaQueryClass.width / 2,
              //   ),
              // )
            ],
          );
        }),
      ),
    );
  }

  startTime() async {
    var _duration = const Duration(milliseconds: 2000);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    bool isLogin = SharedPreferencesHelper.isLogin();
    String routeName = MyRouters.homeScreen;
    if (!isLogin) {
      routeName = MyRouters.login;
    }
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
