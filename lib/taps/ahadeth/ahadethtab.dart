import 'package:flutter/material.dart';
import 'package:islamic/model/screen_details_arg.dart';
import 'package:islamic/screens/ahadeth_details/ahadeth_details.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.ahadethTapLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContant(),
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
        Expanded(child: Center(
          child: Text("الأحاديث",
            style: AppTheme.mediumTitleTextStyle,
            textAlign: TextAlign.center,),
        )),
        const Divider(thickness: 3,color: AppColors.orange,),
        Expanded(flex:13,child: buildScreenListView())
      ],
    );
  }
  ListView buildScreenListView() {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context,index){
          String hadethName = "الحديث رقم  ${index + 1}";
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(onTap: (){
                ScreenDetailsArgs arguments =ScreenDetailsArgs(fileName: "h${index+1}.txt"
                    , name: hadethName);
                Navigator.pushNamed(context, AhadethDetails.rountName,arguments:arguments);
              },
                  child: Expanded(child: Text(hadethName,style: AppTheme.smallTitleTextStyle,textAlign: TextAlign.center,))),
            ],
          );
        });
  }

}
