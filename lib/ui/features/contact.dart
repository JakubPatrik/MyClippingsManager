
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_clippings_web/ui/home/responsiveLayout.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}


// ignore: must_be_immutable
class LargeChild extends StatelessWidget{

  _launchURL() async {
    const url = 'https://github.com/JakubPatrik/ClippingsManager';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  sendto(String email) {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          'subject': 'Example Subject & Symbols are allowed!'
        }
    );
    launch(_emailLaunchUri.toString());
  }



  Widget contact(String name, String title, String email){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200, width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/" + name.toString().toLowerCase().split(' ')[0] + ".png"),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              color: Colors.deepPurple.withOpacity(0.2),
            ),
          ),
          RichText(
              text: TextSpan(
                text: name,
                style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black87),
              )
          ),
          Padding(
            padding: EdgeInsets.only(left:12, top: 20),
            child: Text(title, style: TextStyle(fontSize: 18),),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left:12, top: 20),
            child: FlatButton.icon(
              icon: Icon(Icons.email),
              label: Text(email, style: TextStyle(fontSize: 18),),
              onPressed: ()=>sendto(email),
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: .5,
                child: Image.asset("assets/contact.png"),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .5,
                child: Padding(
                    padding: EdgeInsets.only(left: 48, top: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                              text: "All of Our Users Trust Their MyClipping To Us",
                              style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black87),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:12, top: 20),
                          child: Text("It\'s wicked-easy and totally flexible. Enables you to organize, "
                              "manage and conveniently view your MyClippings.",
                            style: TextStyle(fontSize: 18),),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left:12, top: 20),
                          child: Text("It\'s wicked-easy and totally flexible. Enables you to organize, "
                              "manage and conveniently view your MyClippings.",
                            style: TextStyle(fontSize: 18),),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 600,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [Color(0xFFC86DD7).withOpacity(0.5), Color(0xFF3023AE).withOpacity(0.5)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("MyClippings Manager ©2020",
                        style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Linotte'),
                      ),
                      SizedBox(width: 20,),
                      RaisedButton.icon(onPressed: _launchURL, icon: Icon(Icons.link), label: Text("GitHub Repo for this project"))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    contact("Jakub", "Co-Founder", "jakub.pa27@gmail.com"),
                    Spacer(),
                    contact("Matus", "Co-Founder", "matus.hancikovsky@gmail.com"),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// ignore: must_be_immutable
class SmallChild extends StatelessWidget{

  _launchURL() async {
    const url = 'https://github.com/JakubPatrik/ClippingsManager';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  sendto(String email) {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          'subject': 'Example Subject & Symbols are allowed!'
        }
    );
    launch(_emailLaunchUri.toString());
  }

  Widget contact(String name, String title, String email){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200, width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/" + name.toString().toLowerCase().split(' ')[0] + ".png"),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                color: Colors.deepPurple.withOpacity(0.2),
              ),
            ),
            Text(name,
              style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            Padding(
              padding: EdgeInsets.only(left:12, top: 20),
              child: Text(title, style: TextStyle(fontSize: 18),),
            ),
            Padding(
              padding: EdgeInsets.only(left:12, top: 20),
              child: FlatButton.icon(
                icon: Icon(Icons.email),
                label: Flexible(child: Text(email, style: TextStyle(fontSize: 18),)),
                onPressed: ()=>sendto(email),
              ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/contact.png", scale: 1,),
            ),
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("All of Our Users Trust Their MyClipping To Us",
                      style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:12, top: 20),
                      child: Text("It\'s wicked-easy and totally flexible. Enables you to organize, "
                          "manage and conveniently view your MyClippings.",
                        style: TextStyle(fontSize: 18),),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left:12, top: 20),
                      child: Text("It\'s wicked-easy and totally flexible. Enables you to organize, "
                          "manage and conveniently view your MyClippings.",
                        style: TextStyle(fontSize: 18),),
                    ),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contact("Jakub", "Co-Founder", "jakub.pa27@gmail.com"),
                  SizedBox(height: 20,),
                  contact("Matus", "Co-Founder", "matus.hancikovsky@gmail.com"),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("MyClippings Manager ©2020",
                      style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Linotte'),
                    ),
                    SizedBox(width: 20,),
                    RaisedButton.icon(onPressed: _launchURL, icon: Icon(Icons.link), label: Text("GitHub Repo for this project"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
