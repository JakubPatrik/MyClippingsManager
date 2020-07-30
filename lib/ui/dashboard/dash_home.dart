import 'package:flutter/material.dart';
import 'package:my_clippings_web/app/models/views.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';
import 'package:my_clippings_web/ui/home/responsiveLayout.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';

class DashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

// ignore: must_be_immutable
class LargeChild extends StatelessWidget {
  final navViews = ["Dashboard", "Profile", "Settings"];
  String page = Views().getView;

  List<Widget> navItem(BuildContext context) {
    return navViews.map((text) {
      return Padding(
          padding: EdgeInsets.only(left: 18),
          child: RaisedButton(
            onPressed: () =>
                Provider.of<Views>(context, listen: false).updateView(text),
            elevation: 0,
            color: Colors.transparent,
            child: Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            hoverColor: Colors.white24,
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    topLeft: Radius.circular(70)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 8),
                    blurRadius: 8,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                              child: Text('C',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                        ),
                        SizedBox(width: 16,),
                        Center(
                          child: Text('Clippings\nManager',
                            style: TextStyle(
                                fontSize: ResponsiveLayout.isSmallScreen(context) ? 20 : 26),
                          ),
                        ),
                      ],
                    ),
                    ...navItem(context)
                  ]..add(RaisedButton(
                        onPressed: () {
                          context.read<FirebaseAuthService>().signOut();
                        },
                        child: Text('Sign Out'),
                      ),
                    ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your\nDashboard",
                    style: TextStyle(fontSize: 40),
                  ),
                  Consumer<Views>(builder: (context, data, child) {
                    if (data.getView == "Dashboard") {
                      return Expanded(
                        child: Container(width: 300, color: Colors.red),
                      );
                    } else if (data.getView == "Profile") {
                      return Expanded(
                        child: Container(
                            height: 300, width: 300, color: Colors.green),
                      );
                    } else if (data.getView == "Settings") {
                      return Expanded(
                        child: Container(
                            height: 300, width: 300, color: Colors.blue),
                      );
                    } else {
                      return null;
                    }
                  })
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, right: 50.0, bottom: 50.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 200,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 200,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: HomeView(),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color:Colors.red));
  }
}

/*

SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



          ],
        ),
      ),

*/
