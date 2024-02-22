import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLocale = "en";

  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }

}