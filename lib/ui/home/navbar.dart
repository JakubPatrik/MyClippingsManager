import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_clippings_web/app/models/page.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';
import 'package:my_clippings_web/ui/home/responsiveLayout.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NavBar extends StatelessWidget{

  final navLinks = ["Home", "Features", "Contact"];
  String page = Pages().getPage;

  List<Widget> navItem(BuildContext context){
    return navLinks.map((text){
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: RaisedButton(
          onPressed: () => Provider.of<Pages>(context, listen:false).updatePage(text),
          elevation: 0,
          color: Colors.transparent,
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          hoverColor: Colors.white24,
        )
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                      colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Center(
                  child: Text('C', style: TextStyle(color: Colors.white, fontSize: 30 ),),
                ),
              ),
              SizedBox(width: 16,),
              Text(ResponsiveLayout.isSmallScreen(context) ? 'Clippings\nManager' : 'Clippings Manager', style: TextStyle(
                  fontSize: ResponsiveLayout.isSmallScreen(context) ? 20 : 26 ),
              ),
            ],
          ),
          if(!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [...navItem(context)]..add(
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120, height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
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
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: FlatButton.icon(
                          color: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          icon: Icon(FontAwesomeIcons.google, color: Colors.white,),
                          label: Container(
                            child: Text("Sign", style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1), ),
                          ),
                          onPressed: () {
                            context.read<FirebaseAuthService>().signInWithGoogle();
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ),
            )
          else PopupMenuButton(
            icon: Icon(Icons.menu, size: 26),
            itemBuilder: (BuildContext context) {
              return navLinks.map((text) {
                return PopupMenuItem(
                  child: FlatButton(
                    child: Text(text, style: TextStyle(color: Colors.black),textAlign: TextAlign.start,),
                    onPressed: () => Provider.of<Pages>(context, listen:false).updatePage(text),
                  ),
                );
              }).toList()..add(PopupMenuItem(
                child: FlatButton.icon(
                  color: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  icon: Icon(FontAwesomeIcons.google, color: Colors.black,),
                  label: Container(
                    child: Text("Sign", style: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1), ),
                  ),
                  onPressed: () {
                    context.read<FirebaseAuthService>().signInWithGoogle();
                  },
                ),
              ));
            }
          )
        ],
      ),
    );
  }
}