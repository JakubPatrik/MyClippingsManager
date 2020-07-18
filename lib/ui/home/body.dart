
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_clippings_web/ui/home/responsiveLayout.dart';
import 'package:my_clippings_web/ui/signin/widgets/email_sign_in_button.dart';
import 'package:my_clippings_web/ui/signin/widgets/email_sign_up_button.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}


// ignore: must_be_immutable
class LargeChild extends StatefulWidget{

  @override
  _LargeChildState createState() => _LargeChildState();
}

class _LargeChildState extends State<LargeChild> {
  TextEditingController emailCntrl = TextEditingController();

  TextEditingController passwordCntrl = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.asset("assets/landing.png"),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .5,
            child: Padding(
                padding: EdgeInsets.only(left: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello!', style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8591B0),
                    )),
                    RichText(
                        text: TextSpan(
                          text: "MyClippings Manager",
                          style: TextStyle( fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black87),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:12, top: 20),
                      child: Text("LET'S EXPLORE YOUR QUOTES"),
                    ),
                    SizedBox(height: 40),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 4,
                            right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
                            top: 10,
                            bottom: 40
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0,8),
                                  blurRadius: 8,
                                )],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        controller: emailCntrl,
                                        style: TextStyle(fontFamily: 'Linotte', fontSize: 18),
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.email),
                                          border: InputBorder.none,
                                          hintText: 'Your Email',
                                          hintStyle: TextStyle(color: Colors.black),
                                        ),
                                        onChanged: (val) {
                                          setState(() {
                                            this.email = val;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0,8),
                                  blurRadius: 8,
                                )],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        controller: passwordCntrl,
                                        style: TextStyle(fontFamily: 'Linotte', fontSize: 18),
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.vpn_key),
                                          border: InputBorder.none,
                                          hintText: 'Your Password',
                                          hintStyle: TextStyle(color: Colors.black),
                                        ),
                                        onChanged: (val) {
                                          setState(() {
                                            this.password = val;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 4,
                          right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
                          top: 10,
                          bottom: 10
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: EmailSignInButton(email, password),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFFf4f4f4), Color(0xFFf9f9f9)],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0,8),
                                    blurRadius: 8,
                                  )]
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmailSignUpButton(email, password),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class SmallChild extends StatelessWidget{

  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passwordCntrl = TextEditingController();
  String email = '';
  String pass = '';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hello!', style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8591B0),
                )),
                Text("MyClippings Manager",
                  style: TextStyle( fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Padding(
                  padding: EdgeInsets.only(left:12, top: 20),
                  child: Text("LET'S EXPLORE YOUR QUOTES"),
                ),
                SizedBox(height: 40),
                Center(
                  child: Image.asset("assets/landing_no-bg.png", scale: 1,),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 4,
                        right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
                        top: 10,
                        bottom: 40
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 450,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,8),
                              blurRadius: 8,
                            )],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    controller: emailCntrl,
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email),
                                      border: InputBorder.none,
                                      hintText: 'Your Email',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 450,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,8),
                              blurRadius: 8,
                            )],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    controller: emailCntrl,
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.vpn_key),
                                      border: InputBorder.none,
                                      hintText: 'Your Password',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        RaisedButton(
                          onPressed: (){},
                          elevation: 0,
                          color: Colors.transparent,
                          child: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                          hoverColor: Colors.white24,
                        ),
                      ],
                    )
                ),
              ],
            )
        )
    );
  }
}