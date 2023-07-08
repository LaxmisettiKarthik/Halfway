import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final db = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _cpasswordController = TextEditingController();

Future<bool> _register() async {
  if (_cpasswordController.text != _passwordController.text) {
    return false; // Passwords don't match
  }

  try {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    final User? user = userCredential.user;
    if (user != null) {
      await user.sendEmailVerification();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('tempUID', user.uid);

      return true; // Registration success
    } else {
      return false;
    }
  } catch (e) {
    print(e.toString());
  }

  return false; // Registration failed or email is already verified
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _image;
  final picker = ImagePicker();
  String? data;
  Future chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future uploadImage() async {
    Reference storageReference =
        storage.ref().child('images/${Path.basename(_image!.path)}');
    UploadTask uploadTask = storageReference.putFile(_image!);
    await uploadTask;
    print('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      data = fileURL;
    });
    addFormDataToFirestore(data);
  }

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  late final bool _success;

  void addFormDataToFirestore(dataurl) async {
    print(dataurl);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? action = prefs.getString('tempUID');
    try {
      await FirebaseFirestore.instance.collection('users').doc(action).set({
        'FirstName': _firstNameController.text,
        'LastName': _lastNameController.text,
        'PhoneNumber': _numberController.text,
        'ImageURL': dataurl,
      });
      print('Form data added successfully');
    } catch (e) {
      print('Error occurred while adding form data: $e');
    }
  }

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
                  top: MediaQuery.of(context).size.height * 0.36,
                ),
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
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 35, left: 30, right: 30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            _image == null
                                ? const Text('No image selected.')
                                : Image.file(
                                    _image!,
                                    height: 200,
                                  ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: chooseImage,
                              child: const Text('Choose Image'),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _firstNameController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'James',
                                labelText: 'First Name',
                              ),
                            ),
                            TextFormField(
                              controller: _lastNameController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Smith',
                                labelText: 'Last Name',
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'abc@xyz.com',
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _numberController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.phone),
                                hintText: 'Enter a phone number',
                                labelText: 'Phone',
                              ),
                            ),
                            TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: "Password",
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _cpasswordController,
                              decoration: const InputDecoration(
                                labelText: "Confirm Password",
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final reg = await _register();
                                uploadImage();
                                if (reg) {
                                  Fluttertoast.showToast(
                                    msg: "Verification Email is sent!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Try again!!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              },
                              child: const Text('Sign Up'),
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
                                        builder: (_) => const LoginPage(),
                                      ),
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
                                ),
                              ],
                            ),
                          ],
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
        icon: const Icon(
          Icons.favorite,
        ),
        color: colorAnimated.color,
      ),
    ],
  );
}
