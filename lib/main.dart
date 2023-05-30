import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:halfwaynew/src/app/map_my_india_setup.dart';
import 'package:halfwaynew/src/app/my_routers.dart';
import 'package:halfwaynew/src/app/shared_preferences_helper.dart';
import 'package:halfwaynew/src/viwModel/mappls_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.initSharedPrefs();
  MapMyIndiaSetup.initKeys();
  runApp(const MyApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MapplsProvider>(
              create: (context) => MapplsProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: MyRouters.generateRoute,
          navigatorObservers: [routeObserver],
        ));
  }
}

