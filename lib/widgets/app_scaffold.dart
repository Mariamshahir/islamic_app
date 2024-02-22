import 'package:flutter/material.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget bady;
  final Widget ? bottomNavigationBar;

  const AppScaffold({super.key,required this.title,required this.bady, this.bottomNavigationBar});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(themeProvider.mainBackground)),
        ),
        child: Scaffold(
          appBar: buildAppBar(),
          bottomNavigationBar:bottomNavigationBar,
          body: bady,
        ));
  }
  AppBar buildAppBar() => AppBar(
    title: Text(title,),
  );
}
