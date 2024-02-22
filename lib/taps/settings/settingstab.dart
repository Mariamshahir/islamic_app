import 'package:flutter/material.dart';
import 'package:islamic/provider/language_provider.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:provider/provider.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectLanguge = "en";
  late LanguageProvider provider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    themeProvider=Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text(context.getLocalizations.settings,style: themeProvider.titleTap,)),
          SizedBox(height: 12,),
          Text(context.getLocalizations.language,style: themeProvider.smallTitleTextStyle,),
           buildLanguageDropDownButton(),
          SizedBox(height: 8,),
          buildThemeSwitchRow(),
        ],
      ),
    );
  }

  Widget buildLanguageDropDownButton() {
    return DropdownButton<String>(
        items: const[
          DropdownMenuItem(value:"en",child: Text("English")),
          DropdownMenuItem(value:"ar",child: Text("العربيه"))
        ],
        value: selectLanguge,
        isExpanded:true,
        onChanged:(newValue){
          selectLanguge = newValue!;
          provider.setCurrentLocale(selectLanguge);
          setState(() {});
        });
  }

  Widget buildThemeSwitchRow(){
    return Row(
      children: [
        Text("Dark Theme"),
        Spacer(),
        Switch(value: themeProvider.currentTheme == ThemeMode.dark, onChanged: (newValue){
          themeProvider.toggleTheme(newValue);
        })
      ],
    );
  }
}

