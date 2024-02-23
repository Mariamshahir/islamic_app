import 'package:flutter/material.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;

  toggleTheme(bool darkThemeSwitchValue){
    currentTheme = darkThemeSwitchValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
  // Color get activeColor => currentTheme == ThemeMode.light ? AppColors.lightBlack : AppColors.gray;
  //
  // Color get activeTrackColor => currentTheme == ThemeMode.light ? AppColors.gray : AppColors.lightBlack;

  Color get setting => currentTheme == ThemeMode.light ? AppColors.lightBlack : Colors.white;

  Color get counter => currentTheme == ThemeMode.light ? AppColors.brownlight : AppColors.darkBlue80;

  Color get backGroundColor => currentTheme == ThemeMode.light ? AppColors.white80 : AppColors.darkBlue80;

  Color get count => currentTheme == ThemeMode.light ? AppColors.brown : AppColors.darkBlue80;

  Color get playColor => currentTheme == ThemeMode.light ? AppColors.brown : AppColors.yellow;

  Color get dividerColor2 => currentTheme == ThemeMode.light ? AppColors.lightBlack : AppColors.yellow;

  Color get dividerColor => currentTheme == ThemeMode.light ? AppColors.orange : AppColors.yellow;

  String get sebha => currentTheme == ThemeMode.light ? AppAssets.sebha : AppAssets.darkSebha;

  String get mainBackground => currentTheme == ThemeMode.light ? AppAssets.background : AppAssets.darkBackGround;

  String get splash => currentTheme == ThemeMode.light ? AppAssets.splash: AppAssets.darkSplash;

  TextStyle get appBarTextStyle => currentTheme == ThemeMode.light ? AppTheme.appBarTextStyle: AppTheme.appBarDarkTextStyle;

  TextStyle get mediumTitleTextStyle => currentTheme == ThemeMode.light ? AppTheme.mediumTitleTextStyle: AppTheme.mediumTitleDarkTextStyle;

  TextStyle get titleTap => currentTheme == ThemeMode.light ? AppTheme.titleTap: AppTheme.titleTapDark;

  TextStyle get smallTitleTextStyle => currentTheme == ThemeMode.light ? AppTheme.smallTitleTextStyle: AppTheme.smallTitleDarkTextStyle;

  TextStyle get smallTitleTextStyle2 => currentTheme == ThemeMode.light ? AppTheme.smallTitleTextStyle2: AppTheme.smallTitleDarkTextStyle2;
}