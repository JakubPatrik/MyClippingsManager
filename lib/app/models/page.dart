import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pages extends ChangeNotifier{

  final pages = ["Home", "Features", "Contact"];
  String currentPage = "Home";

  String get getPage => currentPage;

  updatePage(String page){
    debugPrint("========= page updated " + page + " ============");
    this.currentPage = page;
    notifyListeners();
  }
}