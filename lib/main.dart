import 'package:flutter/material.dart';
import 'package:islamic/homescreen.dart';
import 'package:islamic/screens/ahadeth_details/ahadeth_details.dart';
import 'package:islamic/screens/sura_details/sura_details.dart';
import 'package:islamic/splash.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        Splash.routeName:(_) => Splash(),
        HomeScreen.routeName:(_) => HomeScreen(),
        SuraDetails.rountName:(_) => SuraDetails(),
        AhadethDetails.rountName:(_) => AhadethDetails(),
      },
    );
  }
}


