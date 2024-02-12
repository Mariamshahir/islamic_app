import 'package:flutter/material.dart';
import 'package:islamic/taps/quran/qurantab.dart';
import 'package:islamic/taps/radio/radiotap.dart';
import 'package:islamic/taps/ahadeth/ahadethtab.dart';
import 'package:islamic/taps/sebha/sebhatab.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTapIndex = 0;
  Widget bady =Container();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.background)),
      ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: buildAppBar(),
          bottomNavigationBar: buildBottomNavigation(),
          body: bady,
        ));
  }

  AppBar buildAppBar() => AppBar(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text("إسلامي", style: AppTheme.appBarTextStyle,),
  );

  Widget buildBottomNavigation() => Theme(
      data: ThemeData(
        canvasColor: AppColors.orange,
      ),
      child: BottomNavigationBar(
        items: [
          buildBottomNavigationBarItem(AppAssets.iconRadio,"الراديو"),
          buildBottomNavigationBarItem(AppAssets.iconSebha,"التسبيح"),
          buildBottomNavigationBarItem(AppAssets.iconAhadeth,"الاحاديث"),
          buildBottomNavigationBarItem(AppAssets.iconQuran,"القران")
        ],
        selectedItemColor: AppColors.lightBlack,
        unselectedItemColor: AppColors.white,
        currentIndex: currentTapIndex,
        onTap: (index){
          currentTapIndex=index;
          if(currentTapIndex == 0){
            bady = RadioTab();
          }else if (currentTapIndex == 1){
            bady = SebhaTab();
          }else if(currentTapIndex == 2){
            bady = AhadethTab();
          }else{
            bady = QuranTab();
          }
          setState(() {});
        },
  ));

  BottomNavigationBarItem buildBottomNavigationBarItem(String imagePath,String label) =>
      BottomNavigationBarItem(icon: ImageIcon(AssetImage(imagePath),size: 32,),label: label);
}
