import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Center(
        child: Column(children: [
          TextField(
            controller: email,
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
          Container(
            child: ElevatedButton(
              child: Text('Submit'),
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email.text)
                    .then((value) => Fluttertoast.showToast(
                        msg: "Password Reset mail is sent..",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0));
              },
            ),
          )
        ]),
      ),
    );
  }
}
