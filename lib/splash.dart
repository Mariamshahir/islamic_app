import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/homescreen.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(themeProvider.splash)),
      ),
      child: Scaffold(),
    );
  }
@override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomeScreen(), ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }
}