import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmailSignUpButton extends StatelessWidget {
  String email;
  String password;

  EmailSignUpButton(String email, String password) {
    this.email = email;
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        MaterialButton(
          splashColor: Colors.black12,
          highlightColor: Colors.transparent,
          highlightElevation: 0,
          elevation: 0,
          hoverElevation: 0,
          hoverColor: Colors.transparent,
          color: Colors.transparent,
          child: Text('Create one!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          onPressed: () {
            context
                .read<FirebaseAuthService>()
                .signUpWithEmailPassword(email, password);
          },
        ),
      ],
    );
  }
}
