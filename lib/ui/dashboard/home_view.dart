
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_clippings_web/app/models/clipping.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final firestore = Firestore.instance;
  String currentID = 'Loading...';
  int id = 0;

  List<Clipping> allClippings = [];

  @override
  void initState() {
    FirebaseAuthService()
        .currentUser()
        .then((value) => init(value).then((value) => id = value));
    super.initState();
  }

  Future<int> init(String uid) async{
    var strim = Firestore.instance
        .collection('users')
        .document(uid)
        .collection('clippings');
    var querySnapshot = await strim.getDocuments();
    var totalEquals = querySnapshot.documents.length;
    id = totalEquals.toInt();
    setState(() {
      currentID = uid;
      id = totalEquals.toInt();
    });
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        body: Stack(children: [
          SingleChildScrollView(
              child: Flex(direction: Axis.horizontal, children: [
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Text(currentID),
                      RaisedButton(
                        child: Text('Select and Upload File'),
                        onPressed: () {
                          startWebFilePicker();
                        },
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: id,
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
                                        Text('Type' + snapshot.data['type'],
                                            style: TextStyle(fontFamily: 'Linotte')),
                                        Text(snapshot.data['location'],
                                            style: TextStyle(fontFamily: 'Linotte')),
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
              ]))
        ]));
  }

  Uint8List _bytesData;

  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final file = uploadInput.files[0];
      final reader = new html.FileReader();
      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsText(file, "Label");
    });
  }

  void _handleResult(Object result) async {


    String wholeText = result.toString();
    wholeText = wholeText.replaceAll(RegExp(r'[\n\r]*| {2,}'), '');

    List<String> clips = wholeText.split('==========');

    //obsolete
    // RegExp exp = new RegExp(r"(.*)(\(.*\))( - \w+\s)(\w+.\s\d*-?\d*)(.*Added on)(.+day)(.*\d{1,2})(.*\.)");
//   RegExp reg = new RegExp(r'(.+)(\(.*\))(-.\w+)(.*\d+ \|)(.*Added on.*GMT\+\d{2}:\d{2})(.*)');

    RegExp reg = new RegExp(r'(.+)(\(.*\))(.*-.\w+)(.*\|)(.*Added on.*GMT\+\d{2}:\d{2})(.*)');
    List<String> group;

    for (int i = 0; i < clips.length-1; i++){
    var temp;
      try{
        temp = reg.firstMatch(clips[i]);
      }catch(e){debugPrint(e);}

      group = temp.groups([0,1,2,3,4,5,6]);

      String book = group[1];
      String author = group[2].replaceAll(new RegExp(r'[(),]'), '');
      String type = group[3].replaceAll(new RegExp(r'[(),-]'), '');
      String location = group[4].replaceAll(new RegExp(r'[(),-]'), '');
      String date = group[5].replaceAll(new RegExp(r'[(),-]'), '');
      String clipping = group[6].replaceAll(new RegExp(r'[(),-]'), '');

      Clipping c = new Clipping(book, author, type, location, date, clipping);
      allClippings.add(c);
      //print(c.toString());

      firestore
          .collection('users')
          .document(currentID)
          .collection('clippings')
          .document(id.toString())
          .setData({
        "book": book,
        "author": author,
        "type": type,
        "location": location,
        "date":date,
        "clipping": clipping,
      }).then((value) {
        print("Clipping added");
      });
      print("========== Clipping added to document " + id.toString() + "=============");
      id++;
    }

  }
}

/*

======== DEBUGGING IN ONLINE DART COMPILER==============
void main(){
  List<String>all = ["The Stone Arrow (Richard Herley)- Bookmark Loc. 508  | Added on Thursday, 18 October 12 12:50:12 GMT+01:00", "Life Every Day Sept-Oct 2012 (Jeff Lucas)- Highlight Loc. 1067  | Added on Tuesday, 30 October 12 08:31:43 GMT+01:00Amos 5:21–24", "Life Every Day Sept-Oct 2012 (Jeff Lucas)- Highlight Loc. 1080-82  | Added on Tuesday, 30 October 12 08:34:29 GMT+01:00When we worship together as a church, it is not to help us escape living in the real world, but to focus on the God who wants us to make a difference. Failure to do that means that we become irrelevant, salt that has lost its taste, and our worship becomes a tuneless din in God’s ears.", "I Was Just Wandering (Jeff Lucas)- Highlight Loc. 215-22  | Added on Wednesday, 28 November 12 22:45:17 GMT+00:00Another kidney punch is the accusation that the teaching isn’t deep enough. What exactly is ‘deep’ preaching? Does ‘deep’ mean that Tom Wright has been oft-quoted, that a grainy image of an ancient Mesopotamian tablet has been flashed up on PowerPoint, and that the sermon has been sprinkled with a few Greek words, other than kebab? Some Christians seem to think that deep teaching happens when they don’t understand what the speaker is talking about, as if their confusion is a sign that they are truly connecting with the transcendental. On the other hand, if a complicated idea is presented clearly, they are tempted to believe that the content is lightweight and the speaker is too. Thus, the better the teacher you are, the more likely you are to be accused of not being deep, because you’re gifted to make the complex accessible. There’s no way to win when that kind of attitude prevails.", "I Was Just Wandering (Jeff Lucas)- Bookmark Loc. 988  | Added on Saturday, 1 December 12 22:21:57 GMT+00:00", "I Was Just Wandering (Jeff Lucas)- Highlight Loc. 1004-5  | Added on Monday, 3 December 12 22:52:42 GMT+00:00when it comes to church, if we’ve been part of one for more than six months, and nothing has upset us yet, we’re probably clinically dead),", "I Was Just Wandering (Jeff Lucas)- Highlight Loc. 1032-34  | Added on Monday, 3 December 12 22:56:24 GMT+00:00Some churches are being vacated, not because people are abandoning God, but rather are looking for Him, and have given up hope of finding Him in what have become temples of the tedious. The exodus from church happens, not necessarily because of doctrine, but dullness.", "I Was Just Wandering (Jeff Lucas)- Highlight Loc. 1039-40  | Added on Monday, 3 December 12 22:58:00 GMT+00:00Be committed to your church, not to how high you jumped last Sunday. Don’t join the mobile crowd who dash from church to church on blessing/excitement safari.", ];


    // RegExp reg = new RegExp(r'(.+)(\(.*\))(-.\w+)(.*\|)(.*Added on.*GMT\+\d{2}:\d{2})(.*)');

    String s = all[7];

     RegExp reg = new RegExp(r'(.+)(\(.*\))(.*-.\w+)(.*\|)(.*Added on.*GMT\+\d{2}:\d{2})(.*)');


    print(reg.firstMatch(s).group(6));
}
========================================================
===========OLD METHOD OF HANDLING UPLOADED FILE=========
//    setState(() {
//      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
//    });
//
//    StringBuffer s = new StringBuffer();
//    _bytesData.forEach((e) {
//      s.writeCharCode(e);
//    });
========================================================
===========THIS METHOD MAY WORK AS WELL=================
clips.map((e) => (){
      var group = exp.firstMatch(e).groups(all);

      String book = group[0];
      String author = group[1].replaceAll(new RegExp(r'[(),]'), '');
      String type = group[2].replaceAll(new RegExp(r'[(),-]'), '');
      String location = group[3].replaceAll(new RegExp(r'[(),]'), '');
      String day = group[4].replaceAll(new RegExp(r'[(),-]'), '');
      String date = group[5].replaceAll(new RegExp(r'[(),-]'), '');
      String clipping = group[6].replaceAll(new RegExp(r'[(),-]'), '');

      Clipping c = new Clipping(book, author, type, location, day, date, clipping);
      allClippings.add(c);

      firestore
          .collection('users')
          .document(currentID)
          .collection('clippings')
          .document(id.toString())
          .setData({
        "book": book,
        "author": author,
        "type": type,
        "location": location,
        "day": day,
        "date":date,
        "clipping": clipping,
      }).then((value) {
        print("Clipping added");
      });
      id++;
    });
========================================================
=============STUPID METHOD OF HANDLING STRING===========
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
========================================================

*/