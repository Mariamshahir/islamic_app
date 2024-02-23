import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLocale = "en";
  SharedPreferences? sharedPreferences;

  Future<void> setItems()async{
    sharedPreferences=await SharedPreferences.getInstance();
    if(getLang()??false){
      currentLocale="en";
    }else{
      currentLocale="ar";
    }
  }

  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
  Future<void> saveTheme(bool isArabic)async{
    await sharedPreferences!.setBool('isArabic', isArabic);
  }

  bool? getLang(){
    return sharedPreferences!.getBool('isArabic');
  }
}