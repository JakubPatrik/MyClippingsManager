import 'package:flutter/material.dart';
import 'package:my_clippings_web/app/services/firebase_auth_service.dart';
import 'package:my_clippings_web/ui/home/HomePage.dart';
import 'package:my_clippings_web/ui/home/home_view.dart';
import 'package:provider/provider.dart';

import 'app/models/page.dart';
import 'app/models/user.dart';

// flutter run -d chrome --web-hostname localhost --web-port 5000

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (_) => FirebaseAuthService(),
      ),
      ChangeNotifierProvider(
        create: (_) => Pages(),
      ),
      StreamProvider(
        create: (context) => context.read<FirebaseAuthService>().onAuthStateChanged,
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Linotte',
        textSelectionColor: Colors.white24
      ),
      debugShowCheckedModeBanner: false,
      title: 'Your Clippings',
      home: Consumer<User>(
        builder: (_, user, __){
          if (user == null) {
            return HomePage();
          }
          else {
            return HomeView();
          }
        },
      )
    );
  }
}

