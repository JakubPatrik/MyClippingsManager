import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgotPasswordButton extends StatelessWidget {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ForgotPasswordButton(String email) {
    this.email = email;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(2),
      child: Text("Forgot password?", style: TextStyle(decoration: TextDecoration.underline, fontFamily: 'Linotte', fontSize: 14),),
      onPressed: () {
        _auth.sendPasswordResetEmail(email: email);
      },
    );
  }
}
