import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:halfwaynew/src/screens/loginPages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  void Logout() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('UID');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: const Text("Logout"),
        onPressed: () {
          Logout;
           Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
        },
      ),
    ));
  }
}
