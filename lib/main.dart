import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halfwaymappls01/screens/authenticationScreens/home_page.dart';
import 'package:halfwaymappls01/screens/authenticationScreens/login_page.dart';
import 'package:halfwaymappls01/screens/authenticationScreens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        title: "rive animation",
        initialRoute: "/",
        routes: {
          "/": (context) => const LoginPage(),
          "/HomePage": (context) => const HomePage(),
          "/loginPage": (context) => const LoginPage(),
          "/registerPage": (context) => const RegisterPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.orange,
              onPressed: () {
                Navigator.pushNamed(context, "/loginPage");
              },
              child: const Text("Login"),
            ),
            MaterialButton(
              color: Colors.orange,
              onPressed: () {
                Navigator.pushNamed(context, "/registerPage");
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
