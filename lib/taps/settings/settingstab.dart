import 'package:flutter/material.dart';
import 'package:islamic/provider/language_provider.dart';
import 'package:islamic/provider/theme_provider.dart';
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
  bool isDarkTheme = false;
  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    themeProvider = Provider.of(context);

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
          SizedBox(height: 20,),
          buildLanguageDropDownButton(),
          SizedBox(height: 20,),
          buildThemeSwitchRow(),
        ],
      ),
    );
  }

  Widget buildLanguageDropDownButton() {
    return DropdownButton<String>(
      items: const[
        DropdownMenuItem(
            value: "en",
            child: Text("English", style: TextStyle(fontSize: 20))),
        DropdownMenuItem(
            value: "ar",
            child: Text("العربيه", style: TextStyle(fontSize: 20))),
      ],
      value: selectLanguage,
      isExpanded: true,
      onChanged: (newValue) {
        selectLanguage = newValue!;
        provider.setCurrentLocale(selectLanguage);
        setState(() {});
      },
    );
  }

  Widget buildThemeSwitchRow() {
    return Row(
      children: [
        Text(context.getLocalizations.darkTheme, style: themeProvider.smallTitleTextStyle,),
        const Spacer(),
        Switch(
            activeColor: Provider.of(context),
            activeTrackColor: AppColors.lightBlack,
            value: isDarkTheme,
            onChanged: (newValue) {
              setState(() {
                isDarkTheme = newValue;
              });
              themeProvider.toggleTheme(newValue);
            })
      ],
    );
  }
  @override
  void initState() {
    super.initState();
    themeProvider = Provider.of(context, listen: false);
    isDarkTheme = themeProvider.currentTheme == ThemeMode.dark;
  }
}
