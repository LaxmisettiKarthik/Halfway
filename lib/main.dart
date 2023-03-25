import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kartihk_map/src/app/my_routers.dart';
import 'package:kartihk_map/src/app/shared_preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesHelper.initSharedPrefs();
  runApp(const MyApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MyRouters.generateRoute,
      navigatorObservers: [routeObserver],
    );
  }
}
