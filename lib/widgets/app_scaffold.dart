import 'package:flutter/material.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget bady;
  final Widget ? bottomNavigationBar;

  const AppScaffold({super.key,required this.title,required this.bady, this.bottomNavigationBar});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background)),
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: buildAppBar(),
          bottomNavigationBar:bottomNavigationBar,
          body: bady,
        ));
  }
  AppBar buildAppBar() => AppBar(
    backgroundColor: AppColors.transparent,
    centerTitle: true,
    elevation: 0,
    title: Text(title, style: AppTheme.appBarTextStyle,),
  );
}
