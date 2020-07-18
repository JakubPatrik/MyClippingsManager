import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:my_clippings_web/ui/signin/widgets/email_sign_in_button.dart';
import 'package:my_clippings_web/ui/signin/widgets/forgot_password_button.dart';

import 'email_sign_up_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passwordCntrl = TextEditingController();
  String email = '';
  String pass = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.white54, blurRadius: 10)],
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                )),
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: emailCntrl,
              onChanged: (val) {
                setState(() => this.email = val);
              },
              style: TextStyle(fontFamily: 'Linotte', fontSize: 18),
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                border: InputBorder.none,
                hintText: 'Your Email',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                )),
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordCntrl,
              onChanged: (val) {
                setState(() => this.pass = val);
              },
              style: TextStyle(fontFamily: 'Linotte', fontSize: 18),
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                border: InputBorder.none,
                hintText: 'Your Password',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  'Keep me logged in',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Linotte',
                  ),
                ),
                Checkbox(
                  value: value,
                  onChanged: (bool newValue) {
                    onChanged(newValue);
                  },
                ),
              ],),
              ForgotPasswordButton(email),
            ],
          ),
          EmailSignInButton(email, pass),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Linotte',
                ),
              ),
              EmailSignUpButton(email, pass),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool value = false;

  onChanged(bool newValue) {
    setState(() {
      value = newValue;
    });
  }
}
