import 'package:flutter/material.dart';
import 'package:islamic/model/screen_details_arg.dart';
import 'package:islamic/provider/theme_provider.dart';
import 'package:islamic/screens/sura_details/sura_details.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:islamic/utils/constants.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  late ThemeProvider themeProvider;
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.quranTapLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContant(context),
              VerticalDivider(thickness: 3,indent: 6,color: themeProvider.dividerColor)
            ],
          ),
        )

      ],
    );
  }

  Widget buildScreenContant(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 3,color: themeProvider.dividerColor),
             Row(
              children: [
                Expanded(child: Text(context.getLocalizations.verses,
                  style: themeProvider.mediumTitleTextStyle,
                  textAlign: TextAlign.center,)),
                Expanded(child: Text(context.getLocalizations.suraName,
                  style: themeProvider.mediumTitleTextStyle,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Divider(thickness: 3,color: themeProvider.dividerColor),
            Expanded(flex:7,child: buildScreenListView())
      ],
    );
  }

  ListView buildScreenListView() {
    return ListView.builder(
                  itemCount: Constants.suraNames.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        ScreenDetailsArgs arguments =ScreenDetailsArgs(fileName: "${index+1}.txt"
                            , name: Constants.suraNames[index]);
                        Navigator.pushNamed(context, SuraDetails.rountName,arguments:arguments);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(child: Text("${Constants.versesNumber[index]}",style: themeProvider.smallTitleTextStyle,textAlign: TextAlign.center,)),
                          Expanded(child: Text(Constants.suraNames[index],style: themeProvider.smallTitleTextStyle,textAlign: TextAlign.center,)),

                        ],
                      ),
                    );
                  });
  }
}
