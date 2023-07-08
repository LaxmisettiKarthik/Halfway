import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar: const ColorBuilder(
          Colors.transparent,
          Colors.blue,
        ),
        textColorAppBar: const ColorBuilder(
          Colors.white,
        ),
        appBarBuilder: _appBar,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1423589989400-cc0270157ed0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.36),
                height: 900,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
                            child: const Text(
                              "Register here!",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 35, left: 30, right: 30),
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
                        TextField(
                          controller: _cpasswordController,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: "Confirm Password",
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
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () async {
                              final registration = await _register();
                              if (registration==true) {
                                Fluttertoast.showToast(
                                    msg: "Verification Email is sent!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Try again!!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            child: const Text('Sign Up'),
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
                                  MaterialPageRoute(
                                      builder: (_) => const LoginPage()),
                                );
                              },
                              child: const Text(
                                'Back to Login',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: colorAnimated.background,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: colorAnimated.background,
    elevation: 0,
    centerTitle: true,
    title: Text(
      "Sign Up",
      style: TextStyle(color: colorAnimated.color),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      color: colorAnimated.color,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: colorAnimated.color,
        ),
      )
    ],
  );
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _cpasswordController = TextEditingController();
late final bool _success;
late String _userEmail, _userid;

Future<bool> _register() async {
  if (_cpasswordController.text == _passwordController.text) {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;
    if (user != null && user.emailVerified== false) {
      await user.sendEmailVerification();
      setState(() {
        _success = true;
        _userEmail = user.email!;
        _userid = user.uid;
      });
    } else {
      setState(() {
        _success = false;
        _userEmail = "";
      });
    }
  }
  return _success;
}

void setState(Null Function() param0) {}
