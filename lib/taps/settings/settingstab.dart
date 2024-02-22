import 'package:flutter/material.dart';
import 'package:islamic/provider/language_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text(context.getLocalizations.settings,style: AppTheme.titleTap,)),
          SizedBox(height: 12,),
          Text(context.getLocalizations.language,style: AppTheme.smallTitleTextStyle,),
           buildLanguageDropDownButton()
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

}

