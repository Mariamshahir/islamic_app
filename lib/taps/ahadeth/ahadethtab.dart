import 'package:flutter/material.dart';
import 'package:islamic/model/screen_details_arg.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/screens/ahadeth_details/ahadeth_details.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  late ThemeProvider themeProvider;

  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider=Provider.of(context);
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.ahadethTapLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContant(context),
            ],
          ),
        )

      ],
    );
  }
  Widget buildScreenContant(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 3,color: themeProvider.dividerColor,),
        Expanded(child: Center(
          child: Text(context.getLocalizations.ahadeth,
            style: themeProvider.mediumTitleTextStyle,
            textAlign: TextAlign.center,),
        )),
         Divider(thickness: 3,color: themeProvider.dividerColor),
        Expanded(flex:13,child: buildScreenListView())
      ],
    );
  }
  ListView buildScreenListView() {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context,index){
          String hadethName = "الحديث رقم ${index + 1}";
          return InkWell(onTap: (){
            ScreenDetailsArgs arguments =ScreenDetailsArgs(fileName: "h${index+1}.txt"
                , name: hadethName);
            Navigator.pushNamed(context, AhadethDetails.rountName,arguments:arguments);
          },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(hadethName,style: themeProvider.smallTitleTextStyle,textAlign: TextAlign.center,),
                ],
              ));
        });
  }

}
