
import 'package:flutter/material.dart';
import 'package:my_clippings_web/ui/features/contact.dart';
import 'package:my_clippings_web/ui/features/features.dart';

import 'package:provider/provider.dart';

import 'package:my_clippings_web/app/models/page.dart';
import 'navbar.dart';
import 'body.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FBFF), Color(0xFFFCFDFD)]
        ),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(), Consumer<Pages>(
                  builder: (context, data, child){
                    if (data.getPage == "Home") {
                      return Body();
                    }
                    else if (data.getPage == "Features") {
                      return Features();
                    }
                    else if (data.getPage == "Contact"){
                      return Contact();
                    }
                    else {
                      return null;
                    }
                  },
              ),
            ],
          ),
        )
      )
    );
  }
}
