import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/homescreen.dart';
import 'package:islamic/provider/language_provider.dart';
import 'package:islamic/screens/ahadeth_details/ahadeth_details.dart';
import 'package:islamic/screens/sura_details/sura_details.dart';
import 'package:islamic/splash.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) =>LanguageProvider() ,
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LanguageProvider provider=Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ar")
      ],
      locale: Locale(provider.currentLocale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        Splash.routeName:(_) => Splash(),
        HomeScreen.routeName:(_) => HomeScreen(),
        SuraDetails.rountName:(_) => SuraDetails(),
        AhadethDetails.rountName:(_) => AhadethDetails(),
      },
      initialRoute: Splash.routeName,
    );
  }
}



