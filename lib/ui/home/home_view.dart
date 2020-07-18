import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final firestore = Firestore.instance;
  String currentID = "null";
  int id = 0;

  @override
  void initState() {
    FirebaseAuthService()
        .currentUser()
        .then((value) => setState(() => currentID = value));
    super.initState();

  }

  Future<int> init() async{
    print(currentID);
    var strim = Firestore.instance
        .collection('users')
        .document(currentID)
        .collection('clippings');
    var querySnapshot = await strim.getDocuments();
    var totalEquals = querySnapshot.documents.length;
    id = totalEquals.toInt();
    print("printed id " + id.toString());
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        body: Stack(children: [
          Row(children: [
            Container(
              color: Colors.lightBlueAccent,
              alignment: Alignment.centerLeft,
              width: 0.5 * MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.indigo,
              alignment: Alignment.centerRight,
              width: 0.5 * MediaQuery.of(context).size.width,
            )
          ]),
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(top: 70, left: 80, right: 80, bottom: 70),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Text(currentID),
                    RaisedButton(
                      onPressed: () {
                        context.read<FirebaseAuthService>().signOut();
                      },
                      child: Text('Sign Out'),
                    ),
                    RaisedButton(
                      onPressed: () => print(currentID),
                      child: Text('Get Doc Count'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        startWebFilePicker();
                      },
                      child: Text('Select and Upload File'),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return StreamBuilder(
                            stream: Firestore.instance
                                .collection('users')
                                .document(currentID)
                                .collection('clippings')
                                .document(index.toString())
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  Firestore.instance
                                          .collection('users')
                                          .document(currentID)
                                          .collection('clippings')
                                          .snapshots() != null) {
                                return Container(
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.tealAccent.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ExpansionTile(
                                    leading: Icon(Icons.library_books),
                                    title: Text("Author: " + snapshot.data['author'],
                                      style: TextStyle(fontFamily: 'Linotte')),
                                    subtitle: Text("Book: " + snapshot.data['book'],
                                        style: TextStyle(fontFamily: 'Linotte')),
                                    trailing: Icon(Icons.arrow_drop_down, size: 30),
                                    children: [
                                      Text(snapshot.data['clipping'],
                                          style: TextStyle(fontFamily: 'Linotte')),
                                    ],
                                  ),
                                );
                              }
                              return ListTile(
                                leading: Icon(Icons.library_books),
                                title: Text("Author: No data",
                                    style: TextStyle(fontFamily: 'Linotte')),
                                subtitle: Text("Book: No data",
                                    style: TextStyle(fontFamily: 'Linotte')),
                                trailing: Icon(Icons.arrow_drop_down, size: 30),
                              );
                            },
                          );
                        }),
                  ],
                ),
              )),
            ]),
          ))
        ]));
  }

  Uint8List _bytesData;

  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();
      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }


  void _handleResult(Object result) async {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
    });

    StringBuffer s = new StringBuffer();
    _bytesData.forEach((e) {
      s.writeCharCode(e);
    });

    String x = s.toString();
    x = x.replaceAll(new RegExp(r'  '), '');


    while (x.length > 1 && x.indexOf('-') != -1) {
      int first = x.indexOf('-');
      String author = x.substring(0, first);
      x = x.substring(first, x.length);

      int second = x.indexOf("GMT") + 10;
      String book = x.substring(0, second);
      x = x.substring(second, x.length);

      int third = x.indexOf("==========");
      String clipping = x.substring(0, third);
      x = x.substring(third + 10, x.length);

      firestore
          .collection('users')
          .document(currentID)
          .collection('clippings')
          .document(id.toString())
          .setData({
        "author": author,
        "book": book,
        "clipping": clipping,
      }).then((value) {
        print("Clipping added");
      });
      id++;
    }
  }
}
