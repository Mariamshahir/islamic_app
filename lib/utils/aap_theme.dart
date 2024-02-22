import 'package:flutter/material.dart';
import 'package:islamic/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.lightBlack,
  );
  static const TextStyle mediumTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.lightBlack,
  );
  static const TextStyle titleTap = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: AppColors.lightBlack,
  );
  static const TextStyle smallTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.lightBlack,
  );
  static const TextStyle smallTitleTextStyle2 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );


  static TextStyle appBarDarkTextStyle = appBarDarkTextStyle.copyWith(color: AppColors.white);
  static TextStyle mediumTitleDarkTextStyle = mediumTitleDarkTextStyle.copyWith(color: AppColors.white);
  static TextStyle titleTapDark = titleTapDark.copyWith(color: AppColors.white);
  static TextStyle smallTitleDarkTextStyle = smallTitleDarkTextStyle.copyWith(color: AppColors.white);
  static TextStyle smallTitleDarkTextStyle2 = smallTitleDarkTextStyle2.copyWith(color: AppColors.white);

  static  ThemeData lightTheme= ThemeData(
    primaryColor: AppColors.orange,
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        centerTitle: true,elevation: 0,
        titleTextStyle: appBarTextStyle),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.cramy),
    dividerColor: AppColors.orange,
    colorScheme: const ColorScheme(brightness: Brightness.light,
        primary: AppColors.orange,
        onPrimary: AppColors.lightorange,
        secondary: AppColors.lightBlack,
        onSecondary: AppColors.lightBlack,
        error: AppColors.error,
        onError: AppColors.error,
        background: AppColors.transparent,
        onBackground: AppColors.transparent,
        surface: AppColors.transparent,
        onSurface: AppColors.transparent),
    iconTheme: const IconThemeData(color: AppColors.brown),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.orange,
        selectedItemColor: AppColors.lightBlack,
      selectedIconTheme: IconThemeData(size: 40),
        unselectedIconTheme: IconThemeData(size: 34)
    )
  );
  static  ThemeData darkTheme= ThemeData(
      primaryColor: AppColors.darkBlue,
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.transparent,
          centerTitle: true,elevation: 0,
          titleTextStyle: appBarTextStyle.copyWith(color: Colors.white)),
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.blueAccent),
      dividerColor: AppColors.yellow,
      colorScheme: const ColorScheme(brightness: Brightness.dark,
          primary: AppColors.darkBlue,
          onPrimary: AppColors.onDarkBlue,
          secondary: AppColors.yellow,
          onSecondary: AppColors.yellow,
          error: AppColors.error,
          onError: AppColors.error,
          background: AppColors.transparent,
          onBackground: AppColors.transparent,
          surface: AppColors.transparent,
          onSurface: AppColors.transparent),
      iconTheme: const IconThemeData(color: AppColors.darkBlue),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBlue,
          selectedItemColor: AppColors.yellow,
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 34),
          unselectedItemColor: Colors.white,
      )
  );
}