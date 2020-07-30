
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_clippings_web/ui/home/responsiveLayout.dart';

class Features extends StatelessWidget{
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

  double h = 250;

  Widget feature(Icon icon, String title, String info ){
    return Container(
      height: h, width: h,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(title),
            Text(info, style: TextStyle(color:Colors.black),
            ),
          ],
        ),
      ),
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
                widthFactor: .6,
                child: Image.asset("assets/features.png"),
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
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xFFf9f9f9),
          child: SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MyClippings Manager",
                      style: TextStyle( fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black87)),
                  Text("Lorem ipsum dolor sit amet na tvoju mamku ked spi",
                      style: TextStyle( fontWeight: FontWeight.w500, color: Colors.orangeAccent)),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      feature(Icon(Icons.vpn_key, size:50, color: Color(0xFFC86DD7),), 'Feature 01', 'Lorem ipsum dolor sit amet na tvoju mamku ked spi'),
                      feature(Icon(Icons.add_circle, size:50, color: Color(0xFFC86DD7)), 'Feature 02', 'Lorem ipsum dolor sit amet na tvoju mamku ked spi'),
                      feature(Icon(Icons.cloud_done, size:50, color: Color(0xFFC86DD7)), 'Feature 03', 'Lorem ipsum dolor sit amet na tvoju mamku ked spi'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: .6,
                child: Image.asset("assets/features1.png"),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerRight,
                widthFactor: .5,
                child: Padding(
                    padding: EdgeInsets.only(left: 48, top: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text( "All of Our Users Trust Their MyClipping To Us",
                          style: TextStyle( fontSize: 45, fontWeight: FontWeight.w500, color: Colors.black87),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:12, top: 20),
                          child: Text("It\'s wicked-easy and totally flexible. Enables you to organize, "
                              "manage and conveniently view your MyClippings.",
                            style: TextStyle(fontSize: 18),),
                        ),
                        SizedBox(height: 40),
                      ],
                    )
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

  double h = 250;

  Widget feature(Icon icon, String title, String info ){
    return Container(
      height: h, width: h,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(title),
            Text(info, style: TextStyle(color:Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Center(
                  child: Image.asset("assets/features.png", scale: 1,),
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
                      ],
                    )
                ),
                Container(
                  color: Color(0xFFf9f9f9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("MyClippings Manager",
                            style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black87)),
                        Text("Lorem ipsum dolor sit amet na tvoju mamku ked spi",
                            style: TextStyle( fontWeight: FontWeight.w500, color: Colors.orangeAccent)),
                        SizedBox(height:30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            feature(Icon(Icons.vpn_key, size:50, color: Color(0xFFC86DD7),), 'Feature 01', 'Lorem ipsum dolor sit amet na tvoju mamku ked spi'),
                            SizedBox(height: 20,),
                            feature(Icon(Icons.add_circle, size:50, color: Color(0xFFC86DD7)), 'Feature 02', 'Lorem ipsum dolor sit amet na tvoju mamku ked spi'),
                            SizedBox(height: 20,),
                            feature(Icon(Icons.cloud_done, size:50, color: Color(0xFFC86DD7)), 'Feature 03', 'Lorem ipsum dolor sit amet na tvoju mamku ked spi'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text( "All of Our Users Trust Their MyClipping To Us",
                          style: TextStyle( fontSize: 45, fontWeight: FontWeight.w500, color: Colors.black87),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:12, top: 20),
                          child: Text("It\'s wicked-easy and totally flexible. Enables you to organize, "
                              "manage and conveniently view your MyClippings.",
                            style: TextStyle(fontSize: 18),),
                        ),
                        SizedBox(height: 40),
                      ],
                    )
                ),
                Center(
                  child: Image.asset("assets/features1.png", scale: 1,),
                ),
              ],
            ),
        )
    );
  }
}