import 'package:flutter/material.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/taps/quran/qurantab.dart';
import 'package:islamic/taps/ahadeth/ahadethtab.dart';
import 'package:islamic/taps/radio/radiotap.dart';
import 'package:islamic/taps/sebha/sebhatab.dart';
import 'package:islamic/taps/settings/settingstab.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTapIndex = 0;
  List<Widget> bodyContent = [ RadioTab(), SebhaTab(), AhadethTab(), QuranTab(),];
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(themeProvider.mainBackground)),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        bottomNavigationBar: buildBottomNavigation(),
        body: bodyContent[currentTapIndex],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
          title:  Text(
            context.getLocalizations.islami,
          ),
          leading: Builder(builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: Icon(Icons.settings,size: 27,color: themeProvider.setting,)
          ))
      );
  }

  Drawer buildDrawer() {
    return Drawer(child:Container(
        child: Settings()
        ,
      ));
  }


  Widget buildBottomNavigation() => Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
      items: [
        buildBottomNavigationBarItem(AppAssets.iconRadio, context.getLocalizations.radio),
        buildBottomNavigationBarItem(AppAssets.iconSebha, context.getLocalizations.sebha,),
        buildBottomNavigationBarItem(AppAssets.iconAhadeth, context.getLocalizations.ahadeth,),
        buildBottomNavigationBarItem(AppAssets.iconQuran, context.getLocalizations.quran,),
      ],
      currentIndex: currentTapIndex,
      onTap: (index) {
        setState(() {
          currentTapIndex = index;
        });
      },
    ),
  );

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String imagePath, String label) =>
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(imagePath),
          size: 32,
        ),
        label: label,
      );
}