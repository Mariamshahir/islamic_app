import 'package:flutter/material.dart';
import 'package:islamic/provider/language_provider.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectLanguage = "en";
  late LanguageProvider provider;
  late ThemeProvider themeProvider;
  late Future<SharedPreferences> _prefsFuture;

  @override
  void initState() {
    super.initState();
    _prefsFuture = SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<LanguageProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder<SharedPreferences>(
      future: _prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Or any other loading indicator
        }

        final prefs = snapshot.data!;
        selectLanguage = prefs.getString('language') ?? 'en';

        return Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(context.getLocalizations.settings, style: themeProvider.titleTap),
              ),
              SizedBox(height: 12,),
              Text(context.getLocalizations.language, style: themeProvider.smallTitleTextStyle),
              buildLanguageDropDownButton(prefs),
              SizedBox(height: 8,),
              buildThemeSwitchRow(prefs),
            ],
          ),
        );
      },
    );
  }

  Widget buildLanguageDropDownButton(SharedPreferences prefs) {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem(value: "en", child: Text("English", style: TextStyle(fontSize: 16))),
        DropdownMenuItem(value: "ar", child: Text("العربيه", style: TextStyle(fontSize: 16))),
      ],
      value: selectLanguage,
      isExpanded: true,
      onChanged: (newValue) {
        selectLanguage = newValue!;
        provider.setCurrentLocale(selectLanguage);
        prefs.setString('language', selectLanguage);
        setState(() {});
      },
    );
  }

  Widget buildThemeSwitchRow(SharedPreferences prefs) {    return Row(
    children: [
      Text(context.getLocalizations.darkTheme,style: themeProvider.smallTitleTextStyle,),
      Spacer(),
      Switch(activeColor: Provider.of(context),activeTrackColor: AppColors.lightBlack,
          value: themeProvider.currentTheme == ThemeMode.dark,
          onChanged: (newValue){
            themeProvider.toggleTheme(newValue);
            prefs.setBool('isDarkMode', newValue);
          })
    ],
  );
  }
}

