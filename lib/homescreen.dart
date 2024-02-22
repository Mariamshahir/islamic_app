import 'package:flutter/material.dart';
import 'package:islamic/taps/quran/qurantab.dart';
import 'package:islamic/taps/ahadeth/ahadethtab.dart';
import 'package:islamic/taps/radio/radiotap.dart';
import 'package:islamic/taps/sebha/sebhatab.dart';
import 'package:islamic/taps/settings/settingstab.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:islamic/utils/app_language.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTapIndex = 0;
  List<Widget> bodyContent = [ RadioTab(), SebhaTab(), AhadethTab(), QuranTab(),];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.background)),
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
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          elevation: 0,
          title:  Text(
            context.getLocalizations.islami,
            style: AppTheme.appBarTextStyle,
          ),
          leading: Builder(builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },
              icon: Icon(Icons.settings,size: 27,color: AppColors.lightBlack,)
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
    data: ThemeData(
      canvasColor: AppColors.orange,
    ),
    child: BottomNavigationBar(
      items: [
        buildBottomNavigationBarItem(AppAssets.iconRadio, context.getLocalizations.radio),
        buildBottomNavigationBarItem(AppAssets.iconSebha, context.getLocalizations.sebha,),
        buildBottomNavigationBarItem(AppAssets.iconAhadeth, context.getLocalizations.ahadeth,),
        buildBottomNavigationBarItem(AppAssets.iconQuran, context.getLocalizations.quran,),
      ],
      selectedItemColor: AppColors.lightBlack,
      unselectedItemColor: AppColors.white,
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