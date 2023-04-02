import 'package:flutter/material.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/constants/custom_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
            color: CustomColor.blueColor,
            onPressed: () {
              Navigator.pushNamed(context, MyRouters.mapMyIndiaScreen);
            },
            child: Text(
              "Go to Map",
              style: TextStyle(color: CustomColor.colorWhite),
            )),
      ),
    );
  }
}
