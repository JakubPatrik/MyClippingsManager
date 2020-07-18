import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmailSignInButton extends StatelessWidget {
  String email;
  String password;

  EmailSignInButton(String email, String password) {
    this.email = email;
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.black12,
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      elevation: 0,
      hoverElevation: 0,
      hoverColor: Colors.transparent,
      color: Colors.transparent,
      child: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
      onPressed: () {
        context
            .read<FirebaseAuthService>()
            .signInWithEmailPassword(email, password);
      },
    );
  }
}
