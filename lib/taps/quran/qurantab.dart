import 'package:flutter/material.dart';
import 'package:islamic/model/screen_details_arg.dart';
import 'package:islamic/screens/sura_details/sura_details.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:islamic/utils/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.quranTapLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContant(),
              VerticalDivider(thickness: 3,color: AppColors.orange,indent: 6,)
            ],
          ),
        )

      ],
    );
  }

  Widget buildScreenContant() {
    return Column(
      children: [
           Divider(thickness: 3,color: AppColors.orange,),
            const Row(
              children: [
                Expanded(child: Text("اسم السورة",
                  style: AppTheme.mediumTitleTextStyle,
                  textAlign: TextAlign.center,)),
                Expanded(child: Text("عدد الآيات",
                  style: AppTheme.mediumTitleTextStyle,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            const Divider(thickness: 3,color: AppColors.orange,),
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
                          Expanded(child: Text("${Constants.versesNumber[index]}",style: AppTheme.smallTitleTextStyle,textAlign: TextAlign.center,)),
                          Expanded(child: Text(Constants.suraNames[index],style: AppTheme.smallTitleTextStyle,textAlign: TextAlign.center,)),
                      
                        ],
                      ),
                    );
                  });
  }
}
