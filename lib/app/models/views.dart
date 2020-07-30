import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Views extends ChangeNotifier{

  final views = ["Dashboard", "Profile", "Settings"];
  String currentView = "Dashboard";

  String get getView => currentView;

  updateView(String view){
    debugPrint("========= view updated " + view + " ============");
    this.currentView = view;
    notifyListeners();
  }
}