import 'package:flutter/material.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  late ThemeProvider themeProvider;
   RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(AppAssets.radio)),
        const SizedBox(height: 35,),
        Text(context.getLocalizations.elQuranElKarimRadio,style: themeProvider.smallTitleTextStyle,),
        const SizedBox(height: 30,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous,size: 30,),
            SizedBox(width: 15,),
            Icon(Icons.play_arrow,size: 50,),
            SizedBox(width: 15,),
            Icon(Icons.skip_next,size: 30,)
          ],
        )
      ],
    );
  }
}
