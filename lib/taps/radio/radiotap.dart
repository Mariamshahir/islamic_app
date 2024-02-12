import 'package:flutter/material.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_assets.dart';
import 'package:islamic/utils/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(AppAssets.radio)),
        SizedBox(height: 35,),
        Text("إذاعة القرآن الكريم",style: AppTheme.smallTitleTextStyle,),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous,color: AppColors.brown,size: 30,),
            SizedBox(width: 15,),
            Icon(Icons.play_arrow,color: AppColors.brown,size: 50,),
            SizedBox(width: 15,),
            Icon(Icons.skip_next,color: AppColors.brown,size: 30,)
          ],
        )
      ],
    );
  }
}
