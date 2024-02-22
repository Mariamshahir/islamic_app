import 'package:flutter/material.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;

  toggleTheme(bool darkThemeSwitchValue){
    currentTheme = darkThemeSwitchValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  String get mainBackground => currentTheme == ThemeMode.light ? AppAssets.background : AppAssets.darkBackGround;

  String get splash => currentTheme == ThemeMode.light ? AppAssets.splash: AppAssets.darkSplash;

  TextStyle get appBarTextStyle => currentTheme == ThemeMode.light ? AppTheme.appBarTextStyle: AppTheme.appBarDarkTextStyle;

  TextStyle get mediumTitleTextStyle => currentTheme == ThemeMode.light ? AppTheme.mediumTitleTextStyle: AppTheme.mediumTitleDarkTextStyle;

  TextStyle get titleTap => currentTheme == ThemeMode.light ? AppTheme.titleTap: AppTheme.titleTapDark;

  TextStyle get smallTitleTextStyle => currentTheme == ThemeMode.light ? AppTheme.smallTitleTextStyle: AppTheme.smallTitleDarkTextStyle;

  TextStyle get smallTitleTextStyle2 => currentTheme == ThemeMode.light ? AppTheme.smallTitleTextStyle2: AppTheme.smallTitleDarkTextStyle2;
}