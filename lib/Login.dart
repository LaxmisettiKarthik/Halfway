import 'dart:async';
import 'package:RefApp/passwordreset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:RefApp/navbar.dart';

import 'Register.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  late String samp = "null";

  StateMachineController? _controller;
  SMIInput<bool>? _isChecking;
  SMIInput<bool>? _isHandsUp;
  SMIInput<bool>? _trigSuccess;
  SMIInput<bool>? _trigFail;

  @override
  void dispose() {
    _controller?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffD6E2EA),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: size.width,
                  child: RiveAnimation.asset(
                    'assets/login.riv',
                    stateMachines: const ["Login Machine"],
                    onInit: (artboard) {
                      _controller = StateMachineController.fromArtboard(
                          artboard, "Login Machine");
                      if (_controller == null) return;
                      artboard.addController(_controller!);
                      _isChecking = _controller!.findInput("isChecking")!;
                      _isHandsUp = _controller!.findInput("isHandsUp")!;
                      _trigSuccess = _controller!.findInput("trigSuccess")!;
                      _trigFail = _controller!.findInput("trigFail")!;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  onChanged: (value) {
                    if (_isHandsUp != null) {
                      _isHandsUp!.change(false);
                    }
                    if (_isChecking == null) return;
                    _isChecking!.change(true);
                  },
                  onEditingComplete: () {
                    setState(() {
                      _isChecking!.change(false);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: _showPassword,
                  onChanged: (value) {
                    if (_isChecking != null) {
                      _isChecking!.change(false);
                    }
                    if (_isHandsUp == null) return;
                    _isHandsUp!.change(true);
                  },
                  onEditingComplete: () {
                    setState(() {
                      _isHandsUp!.change(false);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        //   setState(() {
                        _showPassword = !_showPassword;
                        if (_showPassword) {
                          _isHandsUp!.change(false);
                        } else {
                          _isHandsUp!.change(true);
                        }

                        //   });
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password?'),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  minWidth: size.width,
                  height: 50,
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {
                    // Simulate a delay before navigating to the home page
                    Timer(const Duration(seconds: 0), () async {
                      //  Navigator.pushNamed(context, "/HomePage");
                      var user = await _login();
                      if (user == '') {
                        print(user);
                        _isChecking?.change(false);
                        _isHandsUp?.change(false);
                        _trigFail?.change(true);

                        Fluttertoast.showToast(
                            msg: "Invalid Credentials or verification pending",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        _isChecking?.change(false);
                        _isHandsUp?.change(false);
                        _trigSuccess?.change(true);
                        print(user);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Navbar()),
                        );
                      }
                    });
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: size.width,
                    child: TextButton(
                      child: Text('Forgot Password?'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const PasswordReset()));
                      },
                    )),
                const SizedBox(height: 20),
                SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          //  setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RegisterPage()));
                          //  });
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;

      if (user != null && user.emailVerified == true) {
        print(user.uid);

        await prefs.setString('UID', user.uid);
        return user.uid;
      } else {
        print(user!.uid);
        return '';
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
}
