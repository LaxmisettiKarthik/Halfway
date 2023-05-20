import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:halfway/screens/Registration.dart';
import 'package:halfway/screens/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail, _userid, samp = "null";

  Future<String> _login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;

      if (user == null) {
        return samp;
      } else {
        await prefs.setString('UID', user.uid);
        return user.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return samp;
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text("Login"),),
      resizeToAvoidBottomInset:true,
        body: Column(
          mainAxisSize : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
                child: const Text(
                  "Welcome to HalfWay",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
          child: Column(children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontFamily: 'Monsterrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontFamily: 'Monsterrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: const Alignment(1, 0),
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: const InkWell(
                  child: Text(
                'forgot password',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monsterrat',
                    decoration: TextDecoration.underline),
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  var user = await _login();
                  if (user != "null") {
                    print(user);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => RegistrationPage()),
                    );
                  } else {
                    print(user);
                    Fluttertoast.showToast(
                        msg: "Invalid login credentials",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text('login'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    'Register here',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'Monsterrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ]),
        )
      ],
    ));
  }
}
