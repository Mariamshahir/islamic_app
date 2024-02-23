import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/homescreen.dart';
import 'package:islamic/provider/language_provider.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/screens/ahadeth_details/ahadeth_details.dart';
import 'package:islamic/screens/sura_details/sura_details.dart';
import 'package:islamic/splash.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LanguageProvider languageProvider =LanguageProvider();
  await languageProvider.setItems();

  ThemeProvider themeProvider =ThemeProvider();
  await themeProvider.setItems();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => languageProvider),
        ChangeNotifierProvider(create: (_) => themeProvider),
      ],
      child: const MyApp()),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LanguageProvider provider=Provider.of(context);
    ThemeProvider themeProvider=Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale("en"),
        Locale("ar")
      ],
      locale: Locale(provider.currentLocale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
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



