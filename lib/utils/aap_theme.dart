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
  static const TextStyle mediumTitleTextStyleText = TextStyle(
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
  static const TextStyle smallTitleTextStyleText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.lightBlack,
  );
  static const TextStyle smallTitleTextStyle2 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static const TextStyle appBarDarkTextStyle = TextStyle(color: AppColors.white,fontSize: 30,
    fontWeight: FontWeight.bold,);
  static const TextStyle mediumTitleDarkTextStyle = TextStyle(color: AppColors.white,fontSize: 25,
    fontWeight: FontWeight.w600,);
  static const TextStyle mediumTitleDarkTextStyleText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.yellow,
  );
  static const TextStyle titleTapDark = TextStyle(color: AppColors.white,fontSize: 30,
    fontWeight: FontWeight.w500,);
  static const TextStyle smallTitleDarkTextStyle = TextStyle(color: AppColors.white,fontSize: 25,
    fontWeight: FontWeight.w400,);
  static const TextStyle smallTitleDarkTextStyleText = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.yellow,
  );
  static const TextStyle smallTitleDarkTextStyle2 = TextStyle(color: AppColors.white,fontSize: 25,
    fontWeight: FontWeight.w400,);

  static  ThemeData lightTheme= ThemeData(
    primaryColor: AppColors.orange,
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        centerTitle: true,elevation: 0,
        titleTextStyle: appBarTextStyle,
      iconTheme: IconThemeData(color: AppColors.lightBlack),
    ),
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
        surface: AppColors.lightBlack,
        onSurface: AppColors.lightBlack),
    iconTheme: const IconThemeData(color: AppColors.brown),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.orange,
        selectedItemColor: AppColors.lightBlack,
      selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 34),
      unselectedItemColor: Colors.white,
    ),
    switchTheme: SwitchThemeData(thumbColor: MaterialStateColor.resolveWith((states) => AppColors.gray),
      trackColor: MaterialStateColor.resolveWith((states) => AppColors.lightBlack),
    ),
  );
  static  ThemeData darkTheme= ThemeData(
      primaryColor: AppColors.darkBlue,
      scaffoldBackgroundColor: AppColors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.transparent,
          centerTitle: true,elevation: 0,
          titleTextStyle: appBarTextStyle.copyWith(color: Colors.white)),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xCC9A794A)),
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
          surface: Colors.white,
          onSurface: Colors.white),
      iconTheme: const IconThemeData(color: AppColors.darkBlue),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBlue,
          selectedItemColor: AppColors.yellow,
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 34),
          unselectedItemColor: Colors.white,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) => AppColors.cramy),
        trackColor: MaterialStateColor.resolveWith((states) => AppColors.gray),
      ),
  );
}